struct A { 
    a: Int = 1;
    b: Bool = true;
}

struct B { 
    c: Int = 2;
    d: A = A{};
}

struct C { 
    e: B = B{};
    f: Int = 3;
    g: Bool = false;
}

contract TestNested {
    c: C = C{};

    init() {
        self.c = C{
            e: B{
                c: 100,
                d: A{
                    a: 200,
                    b: false
                }
            },
            f: 300,
            g: true
        };
    }
}