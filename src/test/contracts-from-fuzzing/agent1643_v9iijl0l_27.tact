struct NestedDefaults {
    a: Int = 1;
    b: Int = 2;
}

contract TopAndNestedDefaultFields {
    x: Int = 3;
    y: NestedDefaults = NestedDefaults{};
    
    init() {
        self.x = 5;
        self.y = NestedDefaults{};
    }
}
