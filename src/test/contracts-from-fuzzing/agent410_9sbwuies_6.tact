struct A { b: B; x: Int; }
struct B { c: C; y: Int; }
struct C { d: D; z: Int; }
struct D { val: Int; }

contract TestContract {
    data: A;

    init() {
        self.data = A{
            b: B{
                c: C{
                    d: D{
                        val: 1234
                    },
                    z: 30
                },
                y: 20
            },
            x: 10
        };
    }
}
