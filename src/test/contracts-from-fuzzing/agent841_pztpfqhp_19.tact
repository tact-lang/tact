struct Inner1 {
    a: Int?;
    b: Bool;
}

struct Inner2 {
    s: String;
    i: Int;
}

struct Outer {
    i1: Inner1;
    i2: Inner2;
}

contract NestedDiversity {
    stored: Outer;
    init() {
        self.stored = Outer{
            i1: Inner1{a:null,b:true},
            i2: Inner2{s:"hi",i:42}
        };
    }
}
