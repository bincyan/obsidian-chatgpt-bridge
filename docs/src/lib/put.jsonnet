{
  tags: [
    'Active File',
  ],
  summary: 'Update the content of the active file open in Obsidian.\n',
  parameters: [],
  requestBody: {
    description: 'Content of the file you would like to upload. When using `application/json`, place your note text in the `content` property and any additional properties will be written to frontmatter.',
    required: true,
    content: {
      'text/markdown': {
        schema: {
          type: 'string',
          example: '# This is my document\n\nsomething else here\n',
        },
      },
      'application/json': {
        schema: {
          type: 'object',
          required: ['content'],
          properties: {
            content: { type: 'string' },
          },
          additionalProperties: { type: 'string' },
          example: {
            content: '# My document',
            foo: 'bar',
          },
        },
      },
      '*/*': {
        schema: {
          type: 'string',
        },
      },
    },
  },
  responses: {
    '204': {
      description: 'Success',
    },
    '400': {
      description: "Incoming file could not be processed.  Make sure you have specified a reasonable file name, and make sure you have set a reasonable 'Content-Type' header; if you are uploading a note, 'text/markdown' is likely the right choice.\n",
      content: {
        'application/json': {
          schema: {
            '$ref': '#/components/schemas/Error',
          },
        },
      },
    },
    '405': {
      description: 'Your path references a directory instead of a file; this request method is valid only for updating files.\n',
      content: {
        'application/json': {
          schema: {
            '$ref': '#/components/schemas/Error',
          },
        },
      },
    },
  },
}
