struct S1 {
    val: Int?;
    nested: S2?;
}

struct S2 {
    flag: Bool;
}

contract OptNested {
    data: S1 = S1{val: null, nested: null};

    init() {
        self.data = S1{val: 7, nested: S2{flag: true}};
    }
}