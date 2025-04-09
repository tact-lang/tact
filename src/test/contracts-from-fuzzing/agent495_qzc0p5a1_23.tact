struct R {
    a: Int;
}
struct S {
    b: R;
}
struct T {
    c: S;
}
struct U {
    d: T;
}
struct V {
    e: U;
}

contract ExtremeDepth {
    data: V;

    init() {
        self.data = V{
            e: U{
                d: T{
                    c: S{
                        b: R{
                            a: 42
                        }
                    }
                }
            }
        };
    }
}