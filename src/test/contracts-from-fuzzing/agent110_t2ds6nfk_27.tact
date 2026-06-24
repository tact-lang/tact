struct Inner {
    a: Int;
    b: String;
}

contract NullInit {
    foo: Inner?;
    init() {
        self.foo = null;
    }
}