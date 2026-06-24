struct S1 {
    f1: Int;
    f2: Bool;
}
struct S2 {
    s1: S1;
    s1opt: S1?;
    b: Bool?;
}
contract NestedStructOpt {
    s2: S2;
    init() {
        self.s2 = S2{
            s1: S1{f1: 1, f2:true},
            s1opt: null,
            b: false
        };
    }
}