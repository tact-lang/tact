struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }
struct Inner3 { c: String; }

struct Mid1 { i1: Inner1; i2: Inner2; }
struct Mid2 { i3: Inner3; }

struct Top {
    m1: Mid1;
    m2: Mid2;
}

contract Layered {
    storage: Top;

    init() {
        self.storage = Top{
            m1: Mid1{i1: Inner1{a:5}, i2: Inner2{b:true}},
            m2: Mid2{i3: Inner3{c:"x"}}
        };
    }
}
