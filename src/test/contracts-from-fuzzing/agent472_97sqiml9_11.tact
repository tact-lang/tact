struct DefaultsTest {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultsContract {
    vals: DefaultsTest;
    init() {
        self.vals = DefaultsTest{ a: 7, b: false, c: "bye" };
    }
}