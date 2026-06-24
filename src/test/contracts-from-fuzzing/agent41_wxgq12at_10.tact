struct Inner1 { val: Int; }
struct Inner2 { flag: Bool; }

struct Outer {
    i1: Inner1;
    i2: Inner2;
}

contract ComposeStructs {
    container: Outer;

    init() {
        self.container = Outer{
            i1: Inner1{val: 10},
            i2: Inner2{flag: false},
        };
    }
}
