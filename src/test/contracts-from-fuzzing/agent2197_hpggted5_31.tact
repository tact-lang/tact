struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    s1opt: S1?;
}

contract DoubleS1 {
    data: S2;

    init() {
        self.data = S2{
            s1: S1{a:1,b:true},
            s1opt: null
        };
    }
}