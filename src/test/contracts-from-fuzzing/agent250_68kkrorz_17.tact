struct S1 {
    val: Int;
}

struct S2 {
    s: S1?;
}

contract ContractWithOptionalStruct {
    f: S2;

    init() {
        self.f = S2{s:null};
    }
}