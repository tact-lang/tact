struct First {
    a: Int;
}

struct Second {
    s: First;
}

struct Third {
    t: Second;
}

struct Fourth {
    f: Third;
}

struct Fifth {
    ff: Fourth;
}

contract VeryDeepNest {
    nested: Fifth;

    init() {
        self.nested = Fifth{
            ff: Fourth{
                f: Third{
                    t: Second{
                        s: First{
                            a: 100
                        }
                    }
                }
            }
        };
    }
}