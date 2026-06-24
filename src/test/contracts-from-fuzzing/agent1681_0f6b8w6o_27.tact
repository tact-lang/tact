struct WithDefault {
    a: Int; 
    b: Int = 42;
}

contract PartialDefaults {
    s: WithDefault;
    init() {
        self.s = WithDefault{ a:1 };
    }
    receive() {
        self.s = self.s;
    }
}