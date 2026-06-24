contract OptionSandwich {
    field: Int?;

    init() {
        self.field = null;
    }
    
    receive() {
        if (self.field == null) {
            self.field = 42;
        } else {
            self.field = null;
        }
    }
}
