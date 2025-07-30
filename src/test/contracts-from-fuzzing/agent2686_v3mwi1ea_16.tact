struct S1 { a: Int; }
struct S2 { s: S1?; b: Bool; }

contract OptStructInStruct {
    data: S2;

    init() {
        self.data = S2{
            s: S1{a: 1},
            b: true
        };
    }
}
