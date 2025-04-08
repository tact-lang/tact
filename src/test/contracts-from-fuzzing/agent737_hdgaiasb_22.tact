struct NestedDeeper {
    one: A;
}

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
    f: F;
}

struct F {
    g: G;
}

struct G {
    x: Int;
}

contract TestContract {
    field: NestedDeeper;

    init() {
        self.field = NestedDeeper{
            one:A{
                b:B{
                    c:C{
                        d:D{
                            e:E{
                                f:F{
                                    g:G{ x:101 }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}
