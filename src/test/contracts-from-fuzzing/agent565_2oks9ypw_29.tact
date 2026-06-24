// Persistent storage: optional nested struct with defaults internally
struct InsideOpt {
    x: Int = 5;
    y: String = "hello";
}

contract WithOptionalNestedDefaults {
    optfield: InsideOpt?;
    
    init() {
        self.optfield = null;
    }
}