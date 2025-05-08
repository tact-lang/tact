struct InnerStruct {
    x: Int as int64;
    y: Int?;
}

contract TestContract {
    point: InnerStruct;

    init() {
        self.point = InnerStruct{
            x: 100,
            y: null,
        };
    }
}