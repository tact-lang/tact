struct S1 {
    flag: Bool = true;
    s2: S2;
}

struct S2 {
    val: Int = 20;
}

contract NestDefaults {
    a: S1;

    init() {
        self.a = S1{flag:false, s2:S2{val:5}};
    }
}