struct OptionalThenStruct {
    maybe: Inner?;
}

struct Inner {
    value: Int;
}

contract OptStructMix {
    data: OptionalThenStruct;

    init() {
        self.data = OptionalThenStruct{
            maybe: null,
        };
    }
}