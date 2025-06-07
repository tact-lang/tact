struct InnerStruct {
    x: Int;
    y: Int?;
}

contract TestContract {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{x: 10, y: null};
    }
}