struct A { s: String }
struct B { a: A }
struct C { b: B }
struct D { c: C }
struct E { d: D }

contract LongStringNest {
    data: E;

    init() {
        self.data = E{
            d: D{
                c: C{
                    b: B{
                        a: A{
                            s: "NestedString",
                        },
                    },
                },
            },
        };
    }
}
