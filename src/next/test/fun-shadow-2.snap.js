export default {
    types: {
        errors: [
            {
                loc: {
                    kind: "range",
                    start: 82,
                    end: 94,
                },
                descr: [
                    {
                        kind: "text",
                        text: 'There already is a function "foo" from',
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
                                        start: 56,
                                        end: 80,
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
