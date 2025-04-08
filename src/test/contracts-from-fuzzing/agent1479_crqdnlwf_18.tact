struct A {
    a: Int;
    b: Bool;
}

struct B {
    x: Int;
    y: A;
}

struct C {
    foo: B;
    bar: Int;
}

contract Test {
    d: C;
    init() {
        self.d = C{
            foo: B{ x:1, y: A{a:2,b:true}},
            bar: 3
        };
    }
}