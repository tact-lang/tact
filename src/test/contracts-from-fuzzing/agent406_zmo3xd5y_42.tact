struct Zero {
    x: Int = 0;
}

contract ZeroTest {
    data: Zero;
    init() {
        self.data = Zero{};
    }
}