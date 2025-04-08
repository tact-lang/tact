struct First {
    a: Int;
}

struct Second {
    b: First;
}

struct Third {
    c: Second;
}

contract NestedMulti {
    ns: Third;

    init() {
        self.ns = Third{
            c: Second{
                b: First{
                    a: 555
                }
            }
        };
    }
}