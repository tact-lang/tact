struct Mid {
    ax: Int;
    bx: String;
}

struct OuterOpt {
    m: Mid?;
}

contract OuterOptContract {
    st: OuterOpt;

    init() {
        self.st = OuterOpt{
            m: null
        };
    }
}
