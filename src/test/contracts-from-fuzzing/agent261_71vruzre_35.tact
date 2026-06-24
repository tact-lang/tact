struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: Bool = false;
    s: String = "test";
}

contract StructDefaultAll {
    val: ManyDefaults;
    
    init() {
        self.val = ManyDefaults{};
    }
    
    receive() {
        let _ = self.val.b;
    }
}