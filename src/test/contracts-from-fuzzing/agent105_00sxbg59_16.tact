struct BigDeep {
    f1: Int;
    f2: Bool?;
    f3: String;
    f4: Int?;
    f5: Bool;
    f6: String?;
    f7: Int;
    f8: Bool?;
    f9: String;
    f10: String?;
}

struct BigNested {
    inner: BigDeep;
    intVal: Int;
    boolVal: Bool;
    optVal: Int?;
}

contract ComplexNested {
    storage: BigNested;

    init() {
        self.storage = BigNested{
            inner: BigDeep{
                f1: 1, f2: null, f3: "a", f4: 4,
                f5: true, f6: null, f7: 7, f8: false,
                f9: "b", f10: null,
            },
            intVal: 42,
            boolVal: false,
            optVal: null,
        };
    }
}