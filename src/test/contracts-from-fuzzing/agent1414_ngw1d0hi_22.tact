struct DefaultsComplex {
    a: Int = 10;
    b: Bool = true;
    c: String = "hello";
    d: Int?;
}

contract ContractDefaultsComplex {
    val: DefaultsComplex;

    init() {
        self.val = DefaultsComplex{};
    }
}