struct HasBool {
    b: Bool;
}

contract OptionalStructField {
    foo: HasBool? = null;
    receive() {
        let _ = self.foo;
    }
}