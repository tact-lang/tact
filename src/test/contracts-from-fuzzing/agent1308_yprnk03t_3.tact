struct A {
    x: Int;
    y: Int?;
}

struct B {
    s: A;
    z: Int?;
}

struct C {
    a: A?;
    b: B?;
    flag: Bool;
}

contract TestContract {
    data: C;
    
    init() {
        self.data = C {
            a: null,
            b: null,
            flag: false
        };
    }
}