struct S1 {
    a: Int?;
}
struct S2 {
    a: S1?;
}

contract OptStruct {
    f: S2;
    init() {
        self.f = S2{a: null};
    }
}
