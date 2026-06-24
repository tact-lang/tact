struct A {
    x: Int;
    y: Int;
}

struct B {
    a: A;
    flag: Bool;
}

struct C {
    b: B;
    txt: String;
}

contract MultiNested {
    state: C;

    init() {
        self.state = C{
            b: B{a:A{x:1,y:2},flag:true},
            txt: "deep"
        };
    }
}