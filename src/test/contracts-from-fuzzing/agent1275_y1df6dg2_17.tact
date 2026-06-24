struct Defaulted {
    x: Int = 10;
    y: String = "abc";
    z: Bool = true;
}

contract ContractWithDefaults {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}