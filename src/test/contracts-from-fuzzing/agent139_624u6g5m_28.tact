struct Zero {
    z: Int = 0;
}

contract StructZeroDefault {
    s: Zero = Zero{};
    init() {
        self.s = Zero{ z: 1 };
    }
}