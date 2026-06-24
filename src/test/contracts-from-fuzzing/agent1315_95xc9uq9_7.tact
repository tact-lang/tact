struct OptionalNested {
    maybeInner: InnerStruct?;
}

struct InnerStruct {
    id: Int;
    label: String;
}

contract OptionalDeep {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{
            maybeInner: InnerStruct{ id: 42, label: "hello" }
        };
    }
}