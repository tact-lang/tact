struct HasDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int?; // implicitly null
}

contract DefaultsInStruct {
    s: HasDefaults;

    init() {
        self.s = HasDefaults{ };
    }
}