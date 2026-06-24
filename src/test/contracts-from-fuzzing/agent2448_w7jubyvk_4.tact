struct GrandChildStruct {
    num: Int;
    optionalBool: Bool?;
}

struct ChildComplex {
    flag: Bool;
    gc: GrandChildStruct;
    textOpt: String?;
}

struct ParentComplex {
    ch: ChildComplex;
    number: Int;
    strField: String;
    optCh: ChildComplex?;
}

contract ComplexNestContract {
    field: ParentComplex;

    init() {
        self.field = ParentComplex {
            ch: ChildComplex {
                flag: true,
                gc: GrandChildStruct {
                    num: 1,
                    optionalBool: null,
                },
                textOpt: null,
            },
            number: 42,
            strField: "hi",
            optCh: null,
        };
    }
}
