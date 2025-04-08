struct Inner1 { a: Int; }
struct Inner2 { b: Int; }

struct Middle {
    i1: Inner1;
    i2: Inner2;
}

struct Outer {
    m: Middle;
    flag: Bool;
}

contract DeepNest {
    val: Outer;

    init() {
        self.val = Outer{
            m: Middle{
                i1: Inner1{ a: 7 },
                i2: Inner2{ b: 9 }
            },
            flag: true
        };
    }
}