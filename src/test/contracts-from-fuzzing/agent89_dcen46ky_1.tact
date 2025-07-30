struct InnerStruct {
    x: Int;
    y: Int?;
}

contract Fuzz1 {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{
            x: 10,
            y: null,
        };
    }
}