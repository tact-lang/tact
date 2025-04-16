struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{
            a: 1,
            b: true,
        };
    }
}