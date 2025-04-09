struct DefPrims {
    x: Int = 777;
    y: Bool = true;
    s: String = "default string";
}

contract DefPrimContract {
    data: DefPrims;

    init() {
        self.data = DefPrims{};
    }
}