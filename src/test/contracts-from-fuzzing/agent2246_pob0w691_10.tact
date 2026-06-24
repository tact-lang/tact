struct S {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
}

contract DefVals {
    val: S;

    init() {
        self.val = S{};
    }
}
