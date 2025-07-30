struct A {
    x: Int;
    y: String;
}

struct B {
    p: A;
    q: A;
    r: A;
    s: A;
}

contract TestContract {
    bval: B;

    init() {
        self.bval = B{
            p: A{x:1,y:"a"},
            q: A{x:2,y:"b"},
            r: A{x:3,y:"c"},
            s: A{x:4,y:"d"},
        };
    }
}