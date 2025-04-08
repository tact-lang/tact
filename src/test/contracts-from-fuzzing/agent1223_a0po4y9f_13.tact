contract DefaultOptional {
    foo: Int?;  
    bar: Bool?;

    init() {
        self.foo = null;
        self.bar = true;
    }
}