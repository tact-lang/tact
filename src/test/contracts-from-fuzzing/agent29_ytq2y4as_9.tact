struct NestedA { valA: Int?; }
struct NestedB { valB: Int?; }
struct NestedC { valC: Int?; }
struct NestedD { valD: Int?; }

struct BigNest {
    a: NestedA?;
    b: NestedB?;
    c: NestedC?;
    d: NestedD?;
}

contract AggregatePersistent {
    agg: BigNest?;

    init() {
        self.agg = null;
    }
}