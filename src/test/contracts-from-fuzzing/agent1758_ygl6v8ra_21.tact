struct S1 { s2: S2?; }
struct S2 { i: Int; }

contract NestedOptInStruct {
    nest: S1;

    init() {
        self.nest = S1 { s2: S2 { i: 99 } };
    }
}