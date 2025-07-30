struct Tiny {
    a: Int;
}

struct Middle {
    b: Tiny;
}

struct Bigger {
    c: Middle;
}

struct Biggest {
    d: Bigger;
}

contract TestContract {
    nested: Biggest;

    init() {
        self.nested = Biggest{
            d: Bigger{
                c: Middle{
                    b: Tiny{ a: 123 }
                }
            }
        };
    }
}