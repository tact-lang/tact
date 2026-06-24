struct InnerDefaults {
    s: String = "default";
    b: Bool = false;
    i: Int = 0;
}

contract StructDefaultsTest {
    data: InnerDefaults;
    
    init() {
        self.data = InnerDefaults{};
    }
}