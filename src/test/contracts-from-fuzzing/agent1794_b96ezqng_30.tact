struct A {
    aa: Int;
}

struct B {
    ba: Int;
    sub: A;
}

struct C {
    ca: Int;
    sub: B;
}

contract MultiStruct {
    data: C;

    init() {
        self.data = C {
            ca: 7,
            sub: B {
                ba: 8,
                sub: A { aa: 9 }
            }
        };
    }
}
