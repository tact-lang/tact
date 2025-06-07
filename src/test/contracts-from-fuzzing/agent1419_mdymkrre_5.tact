struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    s: String;
    b: Bool?;
}

contract OptionalDeep {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{
            inner: InnerStruct{ s: "test", b: null }
        };
    }
}