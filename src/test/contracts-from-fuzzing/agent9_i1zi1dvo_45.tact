struct Zero {
    val: Int = 0;
}

contract ContractDefaultsZero {
    data: Zero;

    init() {
        self.data = Zero{};
    }
}