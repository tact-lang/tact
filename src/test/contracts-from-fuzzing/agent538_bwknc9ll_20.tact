struct A {
    f: Int;
}
struct B {
    af: A;
}
struct C {
    bf: B;
}
struct D {
    cf: C;
}
struct E {
    df: D;
}

contract ChainFive {
    e: E;
    init() {
        self.e = E{
            df: D{
                cf: C{
                    bf: B{
                        af: A{
                            f: 77
                        }
                    }
                }
            }
        };
    }
}
