struct S1 { a: Int; b: Bool; }
struct S2 { x: S1; y: S1; }

contract NestedSameStructs {
    s: S2;

    init() {
        self.s = S2{
            x: S1{ a:1, b:true },
            y: S1{ a:2, b:false }
        };
    }
}
