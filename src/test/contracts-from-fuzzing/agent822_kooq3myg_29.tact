struct HasConst {
    x: Int = 123 + 456;
}

contract TestContract {
    f: HasConst;
    init() {
        self.f = HasConst{};
    }
}
