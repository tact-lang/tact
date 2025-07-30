struct Nested2 {
    val: Int;
    optStr: String? = null;
}

contract OptStructDefault {
    foo: Nested2;

    init() {
        self.foo = Nested2{ val: 123, optStr: null };
    }
}
