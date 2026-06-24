struct NestedOpt {
    x: Int?;
    y: Bool?;
}

contract OptStructTest {
    data: NestedOpt?;
    init() {
        self.data = null;
    }
    receive() {}
}