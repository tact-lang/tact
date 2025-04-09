struct Pair {
    a: Int;
    b: Int;
}

struct PairOpt {
    x: Pair?;
}

struct Wrapper {
    inner: PairOpt;
}

contract OptNested {
    v: Wrapper;
    init() {
        self.v = Wrapper{
            inner: PairOpt{
                x: Pair{ a: 1, b: 2 }
            }
        };
    }
}