struct Zero {
    n: Int;
}

struct One {
    a: Zero;
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

contract Test {
    deep: Four;

    init() {
        self.deep = Four {
            d: Three {
                c: Two {
                    b: One {
                        a: Zero { n: 5 }
                    }
                }
            }
        };
    }

    receive() {}
}