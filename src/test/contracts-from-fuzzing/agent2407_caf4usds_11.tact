contract OptInit {
    foo: Int?;
    bar: String?;
    
    init() {
        self.foo = 123;
        self.bar = null;
    }
}