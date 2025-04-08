struct HasDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "default";
    d: Int?; // should default null
}

contract DefaultsTest {
    s: HasDefaults;

    init() {
        self.s = HasDefaults{
            // omit all fields, rely fully on defaults
            
        };
    }
}