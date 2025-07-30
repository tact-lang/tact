struct Defaulted {
    a: Int = 42;
    b: String = "Hello";
    c: Bool = true;
}

contract DefTest {
    state: Defaulted;

    init() {
        self.state = Defaulted{};
    }
}
