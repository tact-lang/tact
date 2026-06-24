struct OptionalInnerStruct {
    s: Inner?;
}

struct Inner {
    a: Int?;
    b: Bool?;
}

contract Test {
    data: OptionalInnerStruct;

    init() {
        self.data = OptionalInnerStruct{
            s: null,
        };
    }
}