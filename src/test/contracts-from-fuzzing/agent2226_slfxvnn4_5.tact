struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D;
}

struct D {
    e: E;
}

struct E {
    flag: Bool;
}

contract ChainNested {
    val: A;
    init() {
        self.val = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            flag: true
                        }
                    }
                }
            }
        };
    }
}