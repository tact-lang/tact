struct L3 { x: Int; }
struct L2 { midVal: Int?; deep: L3; }
struct L1 { first: Int; nested: L2; }

contract DeeplyNested {
    field: L1;

    init() {
        self.field = L1{ first: 1, nested: L2{ midVal: null, deep: L3{ x: 42 } } };
    }
}