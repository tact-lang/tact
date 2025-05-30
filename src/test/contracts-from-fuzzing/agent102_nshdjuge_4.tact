struct A { f1: Int; }
struct B { f2: A; }
struct C { f3: B; }
struct D { f4: C; }
struct E { f5: D; }

contract MultiLayerNestedTest {
    data: E;

    init() {
        self.data = E{
            f5: D{
                f4: C{
                    f3: B{
                        f2: A{
                            f1: 42
                        }
                    }
                }
            }
        };
    }
}
