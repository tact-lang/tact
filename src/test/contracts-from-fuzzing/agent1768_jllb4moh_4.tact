struct Nested1 {
    a: Int;
}

struct Nested2 {
    b: Nested1;
}

struct Nested3 {
    c: Nested2;
}

struct Nested4 {
    d: Nested3;
}

struct Nested5 {
    e: Nested4;
}

contract TestContract {
    nested: Nested5;
    init() {
        self.nested = Nested5{
            e: Nested4{
                d: Nested3{
                    c: Nested2{
                        b: Nested1{
                            a: 999
                        }
                    }
                }
            }
        };
    }
    receive() {
        self.nested.e.d.c.b.a = 111;
    }
}