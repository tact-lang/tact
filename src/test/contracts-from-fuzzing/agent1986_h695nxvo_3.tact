contract OptionalPrimitive {
    maybeString: String? = null;
    
    init() {
        self.maybeString = "hello";
    }
}
