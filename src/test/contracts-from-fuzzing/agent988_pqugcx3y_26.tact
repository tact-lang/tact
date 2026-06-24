struct DefaultsChain {
    a: Int = 1;
    b: Bool = true;
}

contract DefaultsThenSet {
    data: DefaultsChain;

    init() {
        self.data = DefaultsChain{};
        self.data.a = 55;
        self.data.b = false;
    }
}