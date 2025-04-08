struct SDefaultInner {
    x: Int = 77;
    y: Bool = true;
}

contract DefaultStructVars {
    d: SDefaultInner;
    init() {
        self.d = SDefaultInner{};
    }
}