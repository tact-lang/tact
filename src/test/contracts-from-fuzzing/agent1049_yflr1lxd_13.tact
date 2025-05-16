struct TestS {
    a: Int;
    b: Bool;
    c: String;
}

contract OptionalStruct {
    s: TestS?;

    init() {
        self.s = null;
    }
}