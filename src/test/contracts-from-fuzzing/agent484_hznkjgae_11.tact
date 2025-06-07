struct A { f1: Int }
struct B { f2: A }
struct C { f3: B }
struct D { f4: C }
struct E { f5: D }

struct F {
    f: E;
}

contract TestContract {
    g: F;

    init() {
        self.g = F{
            f: E{
                f5: D{
                    f4: C{
                        f3: B{
                            f2: A{ f1: 100 }
                        }
                    }
                }
            }
        };
    }
}