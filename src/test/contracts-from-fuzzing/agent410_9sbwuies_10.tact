struct F { value: Int; }
struct E { f: F; y: Int; }
struct D { e: E; z: Int; }
struct C { d: D; k: Int; }
struct B { c: C; m: Int; }
struct A { b: B; n: Int; }

contract TestContract {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            f: F{
                                value: 56
                            },
                            y: 5
                        },
                        z: 6
                    },
                    k: 7
                },
                m: 8
            },
            n: 9
        };
    }
}
