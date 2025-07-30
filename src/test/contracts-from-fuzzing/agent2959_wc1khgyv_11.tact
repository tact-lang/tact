struct S {
    a: Int;
    b: String;
    c: Bool;
}

contract ZeroDefaults {
    val: S;

    init() {
        self.val = S{a:0, b:"", c:false};
    }
}