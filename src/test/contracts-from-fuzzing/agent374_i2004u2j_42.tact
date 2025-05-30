// Contract param optional nested struct with defaults
struct What {
    foo: Int = 3;
    bar: Bool = true;
}

contract ParamOptDefault(
    nested: What? // optional
) {
    receive() {
        if (self.nested != null) {
            let _ = self.nested!!.foo;
        }
    }
}