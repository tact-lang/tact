struct HasOptInner {
    foo: Int?;
}

contract NestedOptStruct {
    nested: HasOptInner?;

    init() {
        self.nested = HasOptInner { foo: null };
    }

    receive() {
        if (self.nested != null) {
            let _ = self.nested!!.foo;
        }
    }
}