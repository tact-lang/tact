struct DefaultTest {
    n: Int = 5;
    m: Int = 6;
    s: String = "abc";
    b: Bool = false;
}

contract DefaultVals {
    val: DefaultTest;

    init() {
        self.val = DefaultTest{};
    }
}