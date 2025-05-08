struct NestedPrims {
    x: Prims;
}

struct Prims {
    a: Int;
    b: Bool;
    s: String;
}

contract DeepPrims {
    store: NestedPrims;
    init() {
        self.store = NestedPrims{ x: Prims{ a:1,b:true,s:"abc" } };
    }
}