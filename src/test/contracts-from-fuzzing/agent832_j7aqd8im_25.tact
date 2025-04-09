struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
}

contract StructInits {
    foo: HasDefaults = HasDefaults{};
    receive() {
        let _ = self.foo.b;
    }
}