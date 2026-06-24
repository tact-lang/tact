struct A {
    x: Int;
    b: Bool;
}

struct B {
    y: String;
    c: Cell;
}

struct C {
    a: A;
    b: B;
    z: Bool?;
}

contract TestFuzz {
    storage: C;

    init() {
        self.storage = C{
            a: A{x:123, b:true},
            b: B{y:"hello", c:emptyCell()},
            z: null
        };
    }
}