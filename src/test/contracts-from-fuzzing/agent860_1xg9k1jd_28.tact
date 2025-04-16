struct Zero {
    empty: Cell;
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

contract LongChain {
    data: Three;
    init() {
        self.data = Three{
            two: Two{
                one: One{
                    zero: Zero{
                        empty: emptyCell()
                    }
                }
            }
        };
    }
}