const x1 = {
  kind: "range",
  start: 136,
  end: 148,
};

export default {
  types: {
    scope: {
      functions: new Map([
        ["foo", {
          value: {
            kind: "function",
            inline: false,
            name: {
              kind: "id",
              text: "foo",
              loc: {
                kind: "range",
                start: 140,
                end: 143,
              },
            },
            typeParams: [],
            returnType: undefined,
            params: [],
            body: {
              kind: "regular_body",
              statements: [],
            },
            loc: x1,
          },
          via: {
            kind: "user",
            imports: [],
            defLoc: x1,
          },
        }],
      ]),
    },
  },
  result: [],
};
