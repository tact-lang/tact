contract DefaultValueMix {
    noDefaultInt: Int;
    defaultBool: Bool = false;
    defaultString: String = "hi";
    
    init() {
        self.noDefaultInt = 42;
        self.defaultBool = true;
        self.defaultString = "bye";
    }
}