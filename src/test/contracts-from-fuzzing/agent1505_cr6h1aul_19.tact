struct ComplexDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "s";
    d: Bool?; // implicitly null
    e: Int?;  // implicitly null
}

contract UseDefaults {
    val: ComplexDefaults;
    init() {
        self.val = ComplexDefaults{};
    }
}