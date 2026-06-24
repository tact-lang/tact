struct InnerStruct {
    flag: Bool;
    count: Int;
}

contract StructFieldContract {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{
            flag: true,
            count: 10,
        };
    }
}