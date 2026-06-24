struct DeepNest {
    inner: InnerNested;
}

struct InnerNested {
    a: Int;
    b: Int?;
    c: Nested2;
}

struct Nested2 {
    s: String;
    f: Bool;
}

contract DeepTest {
    store: DeepNest;
    
    init() {
        self.store = DeepNest{
            inner: InnerNested{
                a: 5,
                b: null,
                c: Nested2{
                    s: "abc",
                    f: true,
                }
            }
        };
    }
}