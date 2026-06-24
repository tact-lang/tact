struct Inner { a: Int; }
struct WithDefault {
    b: Int = 42;
    c: Bool?;
    d: Inner; 
}

contract Test {
    s: WithDefault;

    init() {
        self.s = WithDefault{
            c: null,
            d: Inner{ a:1 }
        };
    }
}