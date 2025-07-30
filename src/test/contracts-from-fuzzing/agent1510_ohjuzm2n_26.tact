struct S {
    text: String;
    val: Int;
}

contract TestContract {
    s: S = S{text: "", val: 0};

    init() {
        self.s = S{text: "hello", val: 42};
    }

    receive() {
        let _ = self.s;
    }
}