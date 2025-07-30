struct DefaultVals {
    a: Int = 5;
    b: Bool = false;
    c: String = "default";
}

contract DefaultValsTest {
    val: DefaultVals;

    init() {
        self.val = DefaultVals{}; // rely on defaults
    }
}