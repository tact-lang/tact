struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;

    
    
}

contract OptDefaultTest {
    s: OptionalDefaults;

    init() {
        self.s = OptionalDefaults{};
    }
}