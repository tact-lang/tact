struct InnerStruct {
    nestedInt: Int;
    nestedBool: Bool;
}

contract TestContract {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{
            nestedInt: 1,
            nestedBool: true,
        };
    }
}