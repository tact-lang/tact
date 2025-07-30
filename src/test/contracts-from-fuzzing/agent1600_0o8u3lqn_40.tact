struct TestOptDefault {
    a: Int? = null;
    b: Bool? = null;
}

contract Test {
    state: TestOptDefault;

    init() {
        self.state = TestOptDefault{a: null, b: null};
    }
}