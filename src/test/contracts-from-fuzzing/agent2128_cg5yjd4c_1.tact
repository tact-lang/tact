struct InnerStruct {
    x: Int;
    y: Int?;
}

contract TestStorage {
    point: InnerStruct;

    init() {
        self.point = InnerStruct{
            x: 10,
            y: null
        };
    }
}