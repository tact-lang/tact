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
    x: Int;
    y: Bool?;
}

contract TestContract {
    a: A;

    init() {
        self.a = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            x:1,
                            y:true
                        }
                    }
                }
            }
        };
    }
}