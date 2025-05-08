struct Zero {
    z: Int = 0;
}
contract ZeroField {
    zero: Zero;

    init() {
        self.zero = Zero{};
    }
}