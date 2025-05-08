struct A {
    x: Int;
}

struct B {
    y: Int; 
    z: A;
}

struct C {
    inner1: B;
    inner2: A;
    flag: Bool;
    num: Int?;
}

contract MultiCombo {
    data: C;

    init() {
        self.data = C{
            inner1: B{ y:1, z:A{x:2} },
            inner2: A{x:3},
            flag: true,
            num: null
        };
    }
}