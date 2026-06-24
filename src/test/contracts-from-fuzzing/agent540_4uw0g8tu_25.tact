struct A {
    x: Int;
    y: Int?;
}

contract OptionChain {
    f0: A?;
    f1: A?;
    f2: A?;

    init() {
        self.f0 = null;
        self.f1 = null;
        self.f2 = null;
    }
}