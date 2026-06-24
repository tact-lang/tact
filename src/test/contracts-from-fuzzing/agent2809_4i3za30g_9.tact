struct OptNest {
    nestedOpt: Int?;
}

contract TestContract {
    f1: Int?;
    f2: Bool?;
    f3: OptNest;

    init() {
        self.f1 = 12;
        self.f2 = true;
        self.f3 = OptNest{ nestedOpt: null };
    }
}