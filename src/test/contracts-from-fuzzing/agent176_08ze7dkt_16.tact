struct S1 { a: Int }
struct S2 { s: S1?; b: Int }

contract NestedOptInStruct {
    x: S2;
    init() {
        self.x = S2{ s: null, b: 5 };
    }
}