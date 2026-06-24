struct DefaultTest {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int?; // null default implied
}

contract DefaultsContract {
    data: DefaultTest;
    init() {
        self.data = DefaultTest{};
    }
}