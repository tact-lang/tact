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

struct Five {
    e: Four;
}

contract Chainfive {
    f: Five;

    init() {
        self.f = Five{
            e: Four{
                d: Three{
                    c: Two{
                        b: One{
                            a: 999
                        }
                    }
                }
            }
        };
    }
}