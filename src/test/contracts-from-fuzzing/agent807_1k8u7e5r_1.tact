struct DeepNested {
    a: Int;
    b: Inner;
}

struct Inner {
    c: Int;
    d: Innermost;
}

struct Innermost {
    e: Int;
    f: Int?;
}

contract TestContract {
    storage: DeepNested;
    
    init() {
        self.storage = DeepNested{
            a: 1,
            b: Inner{
                c: 2,
                d: Innermost{
                    e: 3,
                    f: null
                }
            }
        };
    }
}
