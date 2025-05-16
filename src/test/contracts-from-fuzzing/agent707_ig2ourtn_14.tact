struct NestedDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
}

contract WithNestedDefaults {
    x: NestedDefaults;
    y: NestedDefaults;
    
    init() {
        self.x = NestedDefaults{};
        self.y = NestedDefaults{a:5,b:false,c:"bye"};
    }
}