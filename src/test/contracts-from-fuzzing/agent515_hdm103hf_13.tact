struct S1 { a: Int; }
struct S2 { s: S1; b: Bool; }

contract NestedStructs {
    val: S2;

    init() {
        self.val = S2{s: S1{a: 42}, b: false};
    }
}