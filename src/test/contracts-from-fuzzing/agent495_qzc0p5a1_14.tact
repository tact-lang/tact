struct DeeplyNestedOptionals {
    a: L1?;
}

struct L1 {
    b: L2?;
}

struct L2 {
    c: L3?;
}

struct L3 {
    d: Int?;
}

contract NestedOptionals {
    storage: DeeplyNestedOptionals;

    init() {
        self.storage = DeeplyNestedOptionals{
            a: null
        };
    }
}