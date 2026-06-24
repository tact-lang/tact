struct InnerA { a: Int; }
struct InnerB { b: Bool; }

struct OuterComb {
    one: InnerA;
    two: InnerB;
    opt: Int?;
}

contract MixedNested {
    storage: OuterComb;

    init() {
        self.storage = OuterComb{
            one: InnerA{a:10},
            two: InnerB{b:true},
            opt: null
        };
    }
}