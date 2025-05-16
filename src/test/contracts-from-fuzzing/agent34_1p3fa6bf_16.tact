struct DefTest {
    a: Int = 7;
    b: Bool = true;
}

contract Test15 {
    d: DefTest;
    init() {
        self.d = DefTest{};
    }
}