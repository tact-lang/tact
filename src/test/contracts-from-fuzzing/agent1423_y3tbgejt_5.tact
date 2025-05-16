struct OptStruct {
    x: Int?;
    y: Bool?;
}

contract OptionalTester {
    s: OptStruct;
    
    init() {
        self.s = OptStruct{ x: null, y: null };
    }
}