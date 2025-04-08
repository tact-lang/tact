struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }
struct Inner3 { c: String; }

struct Outer {
    x: Inner1;
    y: Inner2;
    z: Inner3;
}

contract CrossNested {
    cross: Outer;
    init() {
        self.cross = Outer{
            x: Inner1{a:1},
            y: Inner2{b:true},
            z: Inner3{c:"hi"}
        };
    }
}