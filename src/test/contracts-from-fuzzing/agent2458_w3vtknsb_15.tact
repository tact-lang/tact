// Test contract fields default values combined with init override
contract InitDefaultTest {
    counter: Int = 10;
    flag: Bool = false;

    init() {
        self.counter = 42;
        self.flag = true;
    }
}