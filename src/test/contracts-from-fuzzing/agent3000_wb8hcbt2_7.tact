struct Inner1 { v1: Int; }
struct Inner2 { v2: Bool; }
struct Inner3 { v3: String; }

struct ComplexNested {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
}

contract Test7 {
    cn: ComplexNested;

    init() {
        self.cn = ComplexNested{
            i1: Inner1{v1:10},
            i2: Inner2{v2:true},
            i3: Inner3{v3:"ok"},
        };
    }
}
