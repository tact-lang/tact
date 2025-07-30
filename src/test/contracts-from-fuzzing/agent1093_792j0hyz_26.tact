contract FieldsAndDefaults {
    x: Int = 5;
    y: Bool;
    z: String = "foo";
    
    init() {
        self.y = true;
    }
}