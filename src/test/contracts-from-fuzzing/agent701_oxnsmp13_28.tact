struct Inner1 { x:Int; }
struct Inner2 { y:Int; }

struct Outer {
    a:Inner1;
    b:Inner2;
}

contract OuterNested {
    val: Outer;

    init() {
        self.val = Outer{
            a: Inner1{ x:1 },
            b: Inner2{ y:2 }
        };
    }
}