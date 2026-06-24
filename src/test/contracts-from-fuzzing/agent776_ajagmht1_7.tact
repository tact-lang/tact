struct WithDefaults {
    a: Int = 10;
    b: Bool = true;
    s: String = "hello";
    opt: Int?; 
}

contract DefaultTest {
    f: WithDefaults;
    init() {
        self.f = WithDefaults{
            opt: null
        };
    }
}