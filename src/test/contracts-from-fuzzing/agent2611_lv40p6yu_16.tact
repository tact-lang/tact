struct WithDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
    d: Address;
}

contract DefaultStruct {
    vals: WithDefaults;
    
    init() {
        self.vals = WithDefaults{
            d: myAddress()
        };
    }
}