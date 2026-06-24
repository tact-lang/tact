struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    val: Inner;

    init() {
        self.val = Inner{a: 1, b: true, c: "test"};
    }
}