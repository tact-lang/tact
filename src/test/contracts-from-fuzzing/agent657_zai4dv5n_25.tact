struct InnerStruct {
    x: Int as uint8;
    y: Bool;
}

contract SerializedNested {
    inner: InnerStruct;

    init() {
        self.inner = InnerStruct{
            x: 255,
            y: true
        };
    }
}