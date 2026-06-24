struct SInner1 { foo: Int }
struct SInner2 { bar: Bool }
struct SInner3 { baz: String }

struct SLarge {
    a: SInner1;
    b: SInner2;
    c:SInner3;
    d:SInner1;
    e:SInner2;
    f:SInner3;
}

contract ManyStructs {
    s: SLarge;

    init() {
        self.s = SLarge{
            a:SInner1{foo:1},
            b:SInner2{bar:true},
            c:SInner3{baz:"hi"},
            d:SInner1{foo:2},
            e:SInner2{bar:false},
            f:SInner3{baz:"yo"}
        };
    }
}