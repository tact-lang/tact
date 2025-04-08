struct A { f: Int }
struct B { f: A }
struct C { f: B }
struct D { f: C }

contract X {
    data: D;

    init() {
        self.data = D{
            f: C{
                f: B{
                    f: A{f:1}
                }
            }
        };
    }
}