struct BigNested {
    a: Int;
    b: Bool;
    c: Struct2;
}

struct Struct2 {
    d: Int;
    e: Bool;
    f: Struct3;
}

struct Struct3 {
    g: Int;
    h: Bool;
}

contract NestedChain {
    storage: BigNested;
    init() {
        self.storage = BigNested{
            a: 1, b: true,
            c: Struct2{
                d: 2, e: false,
                f: Struct3{
                    g: 3, h: true
                }
            }
        };
    }
    receive() {
        let _ = self.storage.c.f.g;
    }
}