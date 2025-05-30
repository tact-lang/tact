struct First {
    a: Int;
}

struct Second {
    f: First;
    b: String;
}

struct Third {
    s: Second;
    c: Bool;
}

struct Fourth {
    t: Third;
    d: Cell;
}

contract TestContract {
    data: Fourth;

    init() {
        self.data = Fourth{
            t: Third{
                s: Second{
                    f: First{
                        a: 555
                    },
                    b: "deep"
                },
                c: true
            },
            d: emptyCell()
        };
    }
}