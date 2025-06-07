struct MultiNested {
    p1: Pair;
    p2: NestedPair;
    p3: NestedNestedPair;
}

struct Pair {
    a: Int;
    b: Bool;
}

struct NestedPair {
    pair1: Pair;
    pair2: Pair;
}

struct NestedNestedPair {
    p: NestedPair;
}

contract MultiNestContract {
    storage: MultiNested;

    init() {
        self.storage = MultiNested{
            p1: Pair{ a:1, b:false },
            p2: NestedPair{
                pair1: Pair{ a: 2, b: true },
                pair2: Pair{ a: 3, b: false }
            },
            p3: NestedNestedPair{
                p: NestedPair{
                    pair1: Pair{ a: 4, b: true },
                    pair2: Pair{ a: 5, b: true }
                }
            }
        };
    }
}