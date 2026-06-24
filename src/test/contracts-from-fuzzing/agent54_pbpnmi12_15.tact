struct Inner {
    strVal: String;
    optInt: Int?;
}

struct Outer {
    intVal: Int;
    optBool: Bool?;
    innerStruct: Inner;
}

contract NestedStructsContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            intVal: 1,
            optBool: null,
            innerStruct: Inner{
                strVal: "hi",
                optInt: null
            }
        };
    }
}