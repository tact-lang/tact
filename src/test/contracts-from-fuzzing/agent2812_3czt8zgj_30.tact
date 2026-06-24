struct TestS {
    f1: Int;
    f2: Bool;
}

contract FieldOrdering {
    s: TestS;
    x: Int;
    b: Bool;

    init() {
        self.s = TestS{ f1: 1, f2: true };
        self.x = 2;
        self.b = false;
    }
}