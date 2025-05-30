struct InnerOptional {
    x: Int?;
    y: Bool?;
    z: Address?;
}

struct OuterStruct {
    inner: InnerOptional?;
    value: Int;
}

contract OptionalNestedStruct {
    state: OuterStruct;

    init() {
        self.state = OuterStruct{
            inner: null,
            value: 7
        };
    }
}