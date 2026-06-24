// Initialize only some fields explicitly in nested structs with defaults
struct NestedDefaults {
    a: Int = 3;
    b: Bool = true;
    c: Int? = null;
}

contract PartialInit {
    s: NestedDefaults;

    init() {
        self.s = NestedDefaults{ a:7, b:false, c:null };
    }
}