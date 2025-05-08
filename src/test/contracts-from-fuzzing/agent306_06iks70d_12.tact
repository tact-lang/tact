struct First {
    value: Int;
}

struct Second {
    f: First;
}

struct Third {
    s: Second;
}

struct Fourth {
    t: Third;
}

contract Cascade {
    data: Fourth;

    init() {
        self.data = Fourth{
            t: Third{
                s: Second{
                    f: First{value: 100}
                }
            }
        };
    }
}
