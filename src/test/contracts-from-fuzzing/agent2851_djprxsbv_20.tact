struct ComplexDefaults {
    i: Int = 42;
    s: String = "satoshi";
    b: Bool = true;
    o: Int?; // implicit null
}

contract DefaultsStructTest {
    val: ComplexDefaults;
    
    init() {
        self.val = ComplexDefaults{};
    }
}
