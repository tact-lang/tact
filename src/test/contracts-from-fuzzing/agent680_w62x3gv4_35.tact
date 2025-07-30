struct InnerIntBool {
    a: Int;
    b: Bool;
}

contract SingleNestedDefaults {
    d: InnerIntBool = InnerIntBool{a:42,b:true};

    init() {
        self.d = self.d;
    }

    receive() {
        let _ = self.d.a + 1;
    }
}