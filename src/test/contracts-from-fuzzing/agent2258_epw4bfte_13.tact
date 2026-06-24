struct OptNested {
    nested: Inner?;
}

struct Inner {
    foo: Int;
}

contract OptNestedContract {
    f: OptNested = OptNested{ nested: null };
    receive() {
        let _ = self.f.nested;
    }
}