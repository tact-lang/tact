struct Bottom {
    m: Int;
    n: Bool?;
}

struct Middle {
    q: Bottom;
    r: String;
}

struct Top {
    s: Middle;
    t: Address?;
    u: Cell;
}

contract Test {
    state: Top;
    init() {
        self.state = Top{
            s: Middle{
                q: Bottom{ m: 1, n: null },
                r: "hey"
            },
            t: null,
            u: emptyCell()
        };
    }
}