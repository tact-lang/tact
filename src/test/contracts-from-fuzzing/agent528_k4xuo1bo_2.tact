struct InnerStruct {
    a: Int;
    b: Int?;
}

contract TestContract {
    data: InnerStruct;
    init() {
        self.data = InnerStruct{a: 10, b: null};
    }
}