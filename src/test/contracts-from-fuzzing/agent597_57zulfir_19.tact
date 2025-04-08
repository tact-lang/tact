struct S2 {
    flag: Bool;
}

struct S1 {
    inner: S2?;
}

contract OptStructOfOptStruct {
    field: S1?;
    init() {
        self.field = S1{ inner: S2{ flag: true } };
    }
}