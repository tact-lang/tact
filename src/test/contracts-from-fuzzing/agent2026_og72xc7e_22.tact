struct A { x: Int; }
struct B { a: A; y: Int; }
struct C { b: B; z: Int; }
struct D { c: C; k: Int; }
struct E { d: D; m: Int; }

contract TestContract {
    nested: E;
    flag: Bool;
    optStr: String?;

    init() {
        self.nested = E{
            d: D{
                c: C{
                    b: B{
                        a: A{ x:1 },
                        y:2
                    },
                    z:3
                },
                k:4
            },
            m:5
        };
        self.flag = true;
        self.optStr = null;
    }
}