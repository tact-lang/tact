export default {
  types: {
    errors: [
      {
        loc: {
          kind: "range",
          start: 136,
          end: 148,
        },
        descr: [
          {
            kind: "text",
            text: "There already is a function \"foo\" from",
          },
          {
            kind: "via",
            via: {
              kind: "user",
              imports: [
                {
                  kind: "tact",
                  loc: {
                    kind: "range",
                    start: 85,
                    end: 109,
                  },
                },
              ],
              defLoc: {
                kind: "range",
                start: 32,
                end: 44,
              },
            },
          },
        ],
      },
    ],
  },
  result: [],
};
