struct InnerVal {
    alpha: Int;
}

struct MidVal {
    beta: Int;
    gamma: InnerVal;
}

struct OuterVal {
    delta: Int;
    epsilon: MidVal;
}

contract ComplexNested {
    cval: OuterVal;

    init() {
        self.cval = OuterVal{
            delta: 1,
            epsilon: MidVal{
                beta:2,
                gamma: InnerVal{ alpha:3 }
            }
        };
    }

    receive() {
        self.cval = OuterVal{
            delta: 10,
            epsilon: MidVal{
                beta:20,
                gamma: InnerVal{ alpha:30 }
            }
        };
    }
}