struct Wrap {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optionalInt: Int?;
    optionalStr: String?;
}

struct Wrap2 {
    nested: Wrap;
    another: Wrap;
}

contract MultiNested {
    data: Wrap2;

    init() {
        self.data = Wrap2{
            nested: Wrap{
                intVal: -1,
                boolVal: true,
                strVal: "str",
                optionalInt: 5,
                optionalStr: null
            },
            another: Wrap{
                intVal: 42,
                boolVal: false,
                strVal: "second",
                optionalInt: null,
                optionalStr: "test"
            }
        };
    }
}
