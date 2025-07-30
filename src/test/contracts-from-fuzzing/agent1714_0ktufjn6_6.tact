struct OptionalNested {
    innerOpt: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    txt: String;
}

contract TestContract {
    holder: OptionalNested;

    init() {
        self.holder = OptionalNested{
            innerOpt: InnerStruct{ val: 1, txt: "x" }
        };
    }
}