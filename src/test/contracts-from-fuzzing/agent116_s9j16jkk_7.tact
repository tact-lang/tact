struct OptionalComplex {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Address?;
    f5: Int?;
    f6: Bool?;
}

contract OptionalComplexContract {
    data: OptionalComplex;

    init() {
        self.data = OptionalComplex{
            f1: null,
            f2: false,
            f3: "optional",
            f4: myAddress(),
            f5: null,
            f6: true,
        };
    }

    receive() {}
}