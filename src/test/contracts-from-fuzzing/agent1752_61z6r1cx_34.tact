struct NestedStr1 { a: Int; }
struct NestedStr2 { s1: NestedStr1; b: Bool; }

contract NestedFieldStructWithOptional {
    nest: NestedStr2?;

    init() {
        self.nest = null;
    }
}