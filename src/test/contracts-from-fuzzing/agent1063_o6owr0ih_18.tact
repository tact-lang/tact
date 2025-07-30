struct S1 { x: Int; }
struct S2 { y: Bool; }

contract TupleFields {
    a: S1;
    b: S2;

    init() {
        self.a = S1{ x: 7 };
        self.b = S2{ y: true };
    }
}