const x1 = {
    kind: "range",
    start: 32,
    end: 44,
};

export default {
    types: {
        scope: {
            functions: new Map([
                [
                    "foo",
                    {
                        value: {
                            kind: "function",
                            inline: false,
                            name: {
                                kind: "id",
                                text: "foo",
                                loc: {
                                    kind: "range",
                                    start: 36,
                                    end: 39,
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
                            imports: [
                                {
                                    kind: "tact",
                                    loc: {
                                        kind: "range",
                                        start: 90,
                                        end: 114,
                                    },
                                },
                            ],
                            defLoc: x1,
                        },
                    },
                ],
            ]),
        },
    },
    result: [],
};
