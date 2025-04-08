struct Zero {
    p1: Int as uint8;
    p2: Int as uint4;

    // no defaults
}

contract TestContract {
    data: Zero;

    init() {
        self.data = Zero{
            p1: 0,
            p2: 0
        };
    }
}