struct DeepNested {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    nested: DeepNested;
    
    init() {
        self.nested = DeepNested{
            inner1: Inner{x: 10, y: true},
            inner2: Inner{x: 20, y: false}
        };
    }
}