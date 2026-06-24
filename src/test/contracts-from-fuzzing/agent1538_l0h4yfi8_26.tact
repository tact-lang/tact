struct HasDefaults {
    i: Int = 7;
    b: Bool = true;
    s: String = "def";
    o: Int? = null;
}

contract Test {
    v: HasDefaults;
    
    init() {
        self.v = HasDefaults{};
    }
}