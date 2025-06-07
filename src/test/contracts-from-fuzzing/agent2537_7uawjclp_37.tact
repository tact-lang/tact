struct BigNestA {
    b: BigNestB;
}
struct BigNestB {
    c: BigNestC;
}
struct BigNestC {
    d: BigNestD;
}
struct BigNestD {
    e: BigNestE;
}
struct BigNestE {
    f: BigNestF;
}
struct BigNestF {
    g: BigNestG;
}
struct BigNestG {
    h: Int; 
    flag: Bool;
}

contract BigNestedTest {
    foo: BigNestA;
    init() {
        self.foo = BigNestA{
            b: BigNestB{
                c: BigNestC{
                    d: BigNestD{
                        e: BigNestE{
                            f: BigNestF{
                                g: BigNestG{
                                    h: 1,
                                    flag: true
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}