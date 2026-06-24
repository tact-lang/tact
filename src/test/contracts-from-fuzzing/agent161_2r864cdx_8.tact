struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
}

contract OptionalWithNested {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ inner: null };
    }

    receive() {
        self.data = OptionalNested{ inner: InnerStruct{ val: 123 } };
    }
}