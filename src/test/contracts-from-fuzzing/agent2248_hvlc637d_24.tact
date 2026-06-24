struct Sub1 {
    a: Int;
    b: String;
}

struct Sub2 {
    c: Bool;
    d: String;
}

struct Top {
    s1: Sub1;
    s2: Sub2;
}

contract NestedMultiple {
    t: Top;

    init() {
        self.t = Top{
            s1: Sub1{a:1,b:"hey"},
            s2: Sub2{c:true,d:"ho"},
        };
    }
}