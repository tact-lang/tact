contract OptionalWithNestedDefaults {
    a: InnerDefaults?;
    
    init() {
        self.a = null;
    }
}

struct InnerDefaults {
    x: Int = 5;
    y: Bool = true;
}
