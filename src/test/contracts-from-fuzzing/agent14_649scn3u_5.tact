struct DefaultVals {
    count: Int = 42;
    status: Bool = true;
    note: String = "ok";
}

contract DefValsTest {
    val: DefaultVals;

    init() {
        self.val = DefaultVals{};
    }
}