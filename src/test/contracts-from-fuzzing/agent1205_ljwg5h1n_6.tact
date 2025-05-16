struct StructWithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
}

contract TestContract {
    s: StructWithDefaults;
    
    init() {
        self.s = StructWithDefaults{};
    }
}