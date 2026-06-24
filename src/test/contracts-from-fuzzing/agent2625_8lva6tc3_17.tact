struct WithDefaults {
    a: Int = 42;
    b: Bool = false;
    c: String = "test";
    d: Int?; // default null
    e: Bool?; // default null
}

contract DefaultVals {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{a:1,b:true,c:"hi",d:null,e:null};
    }
}