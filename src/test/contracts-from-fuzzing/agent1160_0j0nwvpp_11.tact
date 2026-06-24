struct S1 { a: Int; }
struct S2 { s1: S1; b: Int; }

contract NestedSerializations {
    value: S2;

    init() {
        self.value = S2{
            s1: S1{a: 5},
            b: 10
        };
    }
}