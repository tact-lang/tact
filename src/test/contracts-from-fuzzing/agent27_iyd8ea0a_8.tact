struct First {
    a: Int;
}

struct Second {
    b: First;
}

struct Third {
    c: Second;
}

contract DeepNested {
    store: Third;

    init() {
        self.store = Third{
            c: Second{
                b: First{
                    a: 123
                }
            }
        };
    }
}