struct Zero {
    a: Int;
}

struct One {
    zero: Zero;
}

struct Two {
    one: One;
}

struct Three {
    two: Two;
}

struct Four {
    three: Three;
}

contract VeryDeepNesting {
    four: Four;

    init() {
        self.four = Four{
            three: Three{
                two: Two{
                    one: One{
                        zero: Zero{ a: 1 }
                    }
                }
            }
        };
    }
}
