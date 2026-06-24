struct NestedInNested {
    inner1: Int;
    inner2: Bool;
}

struct Outer {
    a: NestedInNested;
    b: NestedInNested;
}

contract StructChain {
    store: Outer;

    init() {
        self.store = Outer{
            a: NestedInNested{inner1:1, inner2:false},
            b: NestedInNested{inner1:2, inner2:true}
        };
    }
}