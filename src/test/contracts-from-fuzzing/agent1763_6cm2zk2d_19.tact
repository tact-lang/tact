struct Zero {
    x: Int as uint4;
    y: Int as uint8;
}

contract TestContract {
    p: Zero;

    init() {
        self.p = Zero{x: 0, y: 0};
    }
}