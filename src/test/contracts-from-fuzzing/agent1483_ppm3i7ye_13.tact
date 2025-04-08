struct A {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Bool?;
    f5: Int?;
    f6: String?;
}

contract MixedOptionalRequired {
    data: A;

    init() {
        self.data = A{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: null,
            f5: null,
            f6: null
        };
    }
}