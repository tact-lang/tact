struct First {
    num: Int;
}

struct Second {
    f: First;
}

struct Third {
    s: Second;
}

contract ChainNested {
    t: Third;

    init() {
        self.t = Third{
            s: Second{
                f: First{
                    num: 100,
                },
            },
        };
    }
}