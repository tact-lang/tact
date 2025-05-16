struct Sub1 { a: Int; }
struct Sub2 { b: Int?; }
struct Sub3 { c: Int; }
struct Sub4 { d: Int?; }

struct Container {
    s1: Sub1;
    s2: Sub2;
    s3: Sub3;
    s4: Sub4;
}

contract NestedMix {
    data: Container;

    init() {
        self.data = Container{
            s1: Sub1{a:1},
            s2: Sub2{b:null},
            s3: Sub3{c:2},
            s4: Sub4{d:null}
        };
    }
}