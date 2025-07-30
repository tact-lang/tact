struct SDefault {
    x: Int = 5;
    y: Bool = false;
}

contract Test6 {
    sdef: SDefault;

    init() {
        self.sdef = SDefault{};
    }

    receive() {}
}