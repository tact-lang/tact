struct OptionalDefault {
    a: Int? = null;
    b: Bool? = null;
}

contract TestContract {
    optDef: OptionalDefault;
    
    init() {
        self.optDef = OptionalDefault{};
    }
}