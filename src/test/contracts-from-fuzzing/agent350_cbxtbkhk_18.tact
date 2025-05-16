contract MissingDefaults {
    foo: Int;
    bar: String;
    
    init() {
        self.foo = 100;
        self.bar = "zzz";
    }
}