struct InnerMost { x: Int }

struct WithDefault {
    a: Int = 0;
    b: Bool = true;
    c: String = "hi";
    d: InnerMost = InnerMost{ x: 5 };
}

contract DefaultVals {
    store: WithDefault;
    
    init() {
        self.store = WithDefault{};
    }
}
