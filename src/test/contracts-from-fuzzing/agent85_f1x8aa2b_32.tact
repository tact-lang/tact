contract NullableBoolDefault {
    b: Bool? = null;
    
    init() {
        self.b = true;
    }

    receive() {}
}