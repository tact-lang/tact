contract DiverseFields {
    foo: Int = 0;
    bar: Bool = false;
    text: String = "hello";
    
    init() {
        self.foo = 42;
        self.bar = true;
        self.text = "world";
    }

    receive() {
        let _ = self.foo;
        let _ = self.bar;
        let _ = self.text;
    }
}