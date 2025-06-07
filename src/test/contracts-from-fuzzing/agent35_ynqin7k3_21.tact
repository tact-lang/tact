struct A { x: Int; }
struct B { a: A; }
struct C { b: B; }
struct D { c: C; }

struct Container {
    d: D;
    txt: String?;
}

contract DeepFields {
    data: Container;

    init() {
        self.data = Container{
            d: D{
                c: C{
                    b: B{
                        a: A{
                            x: 9
                        }
                    }
                }
            },
            txt: null
        };
    }
}