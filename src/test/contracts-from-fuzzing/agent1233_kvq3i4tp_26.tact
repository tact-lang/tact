struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    c: String?;
    d: Bool?;
}

struct Outer {
    i1: Inner1;
    i2: Inner2;
}

contract ComplexNested {
    o: Outer;

    init() {
        self.o = Outer{
            i1: Inner1{a:42,b:true},
            i2: Inner2{c:null,d:null}
        };
    }
}