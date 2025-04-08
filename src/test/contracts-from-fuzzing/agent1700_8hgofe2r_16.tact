struct One {
    a: Int;
}

struct Two {
    b: One;
}

struct Three {
    c: Two;
}

struct Four {
    d: Three;
}

contract TestContract {
    x: Four;

    init() {
        self.x = Four{
            d: Three{
                c: Two{
                    b: One{a: 777}
                }
            }
        };
    }
}