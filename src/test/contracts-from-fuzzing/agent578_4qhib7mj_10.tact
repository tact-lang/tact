struct First {
    x: Int;
    y: Second;
}

struct Second {
    p: Int?;
    q: Bool?;
    r: Third;
}

struct Third {
    s: String?;
    t: Int;
}

contract Cascade {
    c: First;

    init() {
        self.c = First {
            x: 10,
            y: Second {
                p: null,
                q: true,
                r: Third { s: null, t: 99 }
            }
        };
    }
}