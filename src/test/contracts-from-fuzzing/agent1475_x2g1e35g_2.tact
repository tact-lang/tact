struct A {
    x: Int;
}

struct B {
    y: Int?;
}

struct C {
    m: A;
    n: B;
    f: Bool;
}

contract CrossStructs {
    data: C;
    
    init() {
        self.data = C{
            m: A{x: 1},
            n: B{y: null},
            f: true,
        };
    }
}