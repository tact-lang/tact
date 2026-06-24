struct Level4 {
    d: Int;
}

struct Level3 {
    c_opt: Level4?;
}

struct Level2 {
    b_opt: Level3?;
}

struct Level1 {
    a_opt: Level2?;
}

contract OptionalChain {
    opt_chain: Level1;

    init() {
        self.opt_chain = Level1{
            a_opt: null
        };
    }
}