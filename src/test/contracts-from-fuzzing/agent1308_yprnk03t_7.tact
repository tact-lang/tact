struct CustomTuple {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: Address;
    f6: Address?;
}

contract TestContract {
    data: CustomTuple;

    init() {
        self.data = CustomTuple {
            f1: 5,
            f2: null,
            f3: true,
            f4: null,
            f5: myAddress(),
            f6: null
        };
    }
}