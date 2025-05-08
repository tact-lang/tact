struct TestS {
    x: Int;
}

contract OptStructVars {
    a: TestS?;
    b: TestS?;

    init() {
        self.a = TestS{ x: 1 };
        self.b = null;
    }
}