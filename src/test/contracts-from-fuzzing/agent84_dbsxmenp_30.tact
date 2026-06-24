struct InnerStruct {
    x: Int;
    y: Bool?;
    z: String;
}

contract StructWithOptionals {
    field: InnerStruct;

    init() {
        self.field = InnerStruct{
            x: 12,
            y: null,
            z: "hello",
        };
    }
}
