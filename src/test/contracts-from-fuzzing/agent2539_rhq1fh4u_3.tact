struct A {
    x: Int;
}

struct B {
    y: Int;
    z: Bool;
}

struct C {
    a: A;
    b: B;
    flag: Bool;
    number: Int;
}

contract WideNestedContract {
    data: C;
    
    init() {
        self.data = C{
            a: A{x: 1},
            b: B{y: 2, z: true},
            flag: false,
            number: 99
        };
    }
}