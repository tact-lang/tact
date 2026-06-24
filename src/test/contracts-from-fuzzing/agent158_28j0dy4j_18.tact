struct ZeroLevel {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
}

struct TopLevel {
    nested: ZeroLevel;
    extra: Int;
}

contract Combined {
    st: TopLevel;

    init() {
        self.st = TopLevel{
            nested: ZeroLevel{
                intVal: 42,
                boolVal: true,
                strVal: "hi",
                optInt: null,
                optBool: false
            },
            extra: 99
        };
    }
}