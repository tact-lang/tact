struct InnerStruct {
    x: Int;
    y: Bool;
    z: String?;
}

contract NestedStructContract {
    data: InnerStruct;

    init() {
        self.data = InnerStruct {
            x: 123,
            y: false,
            z: null
        };
    }
}
