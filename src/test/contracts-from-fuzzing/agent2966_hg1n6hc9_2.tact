struct One {
    a: Int;
}

struct Two {
    b: Bool;
    c: One;
    d: Bool?;
}

struct Three {
    e: Int;
    f: Two;
}

contract DeepNestedContract {
    nested: Three;
    
    init() {
        self.nested = Three{
            e: 7,
            f: Two{
                b: true,
                c: One{ a: 999 },
                d: null,
            }
        };
    }
}
