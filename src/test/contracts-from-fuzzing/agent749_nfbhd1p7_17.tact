struct Outer {
    s1: Inner1;
    s2: Inner2;
}

struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    c: String;
    d: Address?;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            s1: Inner1{a:1,b:false},
            s2: Inner2{c:"test", d:null},
        };
    }

    receive() {
        let _ = self.outer.s1.a;
    }
}