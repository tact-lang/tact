struct Data {
    x: Int = 1;
    y: Bool = false;
    z: String?;
    w: Cell?;
}

contract NestedTest {
    data: Data;

    init() {
        self.data = Data{};
    }

    receive() {}
}