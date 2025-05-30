struct SubSub {
    q: Bool?;
    r: String;
}

struct Sub {
    k: Int;
    l: SubSub;
}

struct Container {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Sub;
}

contract NestedDeep {
    storage: Container;

    init() {
        self.storage = Container {
            a: 12,
            b: true,
            c: "Hello",
            d: null,
            e: Sub {
                k: 34,
                l: SubSub {
                    q: false,
                    r: "Deep"
                }
            }
        };
    }
}