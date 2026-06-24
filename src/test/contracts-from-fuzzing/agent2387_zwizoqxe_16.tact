struct InnerStruct {
    x: Int;
    y: Int?;
}

contract OptionalFieldReordered {
    s: InnerStruct;
    init() {
        self.s = InnerStruct{
            x: 10,
            y: null,
        };
    }
}