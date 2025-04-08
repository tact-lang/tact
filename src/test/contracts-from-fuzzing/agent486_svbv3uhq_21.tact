struct A { f: Int = 1; }
struct B { f: A; }
struct C { f: B; }
struct D { f: C; }
struct E { f: D; }

contract DeepFive {
    data: E;

    init() {
        self.data = E{
            f: D{
                f: C{
                    f: B{
                        f: A{ f: 999 },
                    },
                },
            },
        };
    }
}