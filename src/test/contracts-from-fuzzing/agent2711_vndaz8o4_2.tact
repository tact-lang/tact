struct Inner {
    nestedInt: Int;
    nestedBool: Bool;
    nestedOptional: Int?;
}

contract ContractWithStruct {
    data: Inner;

    init() {
        self.data = Inner{
            nestedInt: 10,
            nestedBool: false,
            nestedOptional: null,
        };
    }
}