struct InnerA {
    x: Int;
}

struct InnerB {
    y: Bool;
}

struct MixedNested {
    partA: InnerA;
    partB: InnerB;
}

contract MixStructNest {
    nested: MixedNested;

    init() {
        self.nested = MixedNested{
            partA: InnerA{x:123},
            partB: InnerB{y:true}
        };
    }
}