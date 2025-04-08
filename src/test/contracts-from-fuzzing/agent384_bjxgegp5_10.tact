struct NestedOptionalStruct {
    opt: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    text: String;
}

contract TestNestedOptional {
    s: NestedOptionalStruct = NestedOptionalStruct{
        opt: null
    };

    init() {
        self.s.opt = InnerStruct{
            val: 123,
            text: "abc"
        };
    }
}