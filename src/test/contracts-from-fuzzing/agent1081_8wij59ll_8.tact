struct HasDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract DefaultsInStruct {
    val: HasDefaults;
    
    init() {
        self.val = HasDefaults{};
    }
}