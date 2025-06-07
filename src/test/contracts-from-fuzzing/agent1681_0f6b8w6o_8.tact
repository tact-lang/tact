struct DefaultVals {
    val1: Int = 42;
    val2: Bool = true;
    val3: String = "hi";
    val4: Int?;
}

contract DefaultsTest {
    s: DefaultVals;

    init() {
        self.s = DefaultVals{}; // use all defaults
    }

    receive() {
        self.s = DefaultVals{
            val1: self.s.val1 + 1,
            val2: !self.s.val2,
            val3: self.s.val3,
            val4: self.s.val4,
        };
    }
}