message(33) M {
    a: Int;
}

contract Test {
    val: M;

    init() {
        self.val = M{ a: 42 };
    }
}