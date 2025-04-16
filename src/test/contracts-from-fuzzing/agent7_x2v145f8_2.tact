struct InnerStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract Test2 {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{
            x: 11,
            y: true,
            z: "hello",
        };
    }
}