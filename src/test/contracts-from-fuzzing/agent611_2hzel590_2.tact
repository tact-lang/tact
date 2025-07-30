struct DeepNested {
    level: Int;
    sub: Inner;
}

struct Inner {
    x: Int;
    y: Int;
}

contract TestDeep {
    d: DeepNested;
    
    init() {
        self.d = DeepNested{
            level: 3,
            sub: Inner{ x: 1, y: 2 }
        };
    }
}