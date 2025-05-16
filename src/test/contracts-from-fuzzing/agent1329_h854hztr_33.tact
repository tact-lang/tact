struct NestedA { a: Int; }
struct NestedB { b: NestedA; }
struct NestedC { c: NestedB; }
struct NestedD { d: NestedC; }
struct NestedE { e: NestedD; }
struct NestedF { f: NestedE; }
struct NestedG { g: NestedF; }

contract Deep7 {
    val: NestedG;
    init() {
        self.val = NestedG{ g: NestedF{ f: NestedE{ e: NestedD{ d: NestedC{ c: NestedB{ b: NestedA{ a: 0 } } } } } } };
    }
}