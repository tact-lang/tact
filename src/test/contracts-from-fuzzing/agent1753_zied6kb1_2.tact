struct Deepest {
    x: Int;
    y: Bool;
}

struct Inner {
    d: Deepest;
    z: String;
}

struct Outer {
    a: Int;
    b: Inner;
}

contract DeepNestTest {
    record: Outer;
    
    init() {
        self.record = Outer{
            a: 1,
            b: Inner{
                d: Deepest{
                    x: 100,
                    y: false
                },
                z: "test"
            }
        };
    }
}