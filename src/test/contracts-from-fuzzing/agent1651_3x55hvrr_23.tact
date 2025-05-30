struct N {
    s: String;
}

struct M {
    n: N;
}

struct L {
    m: M;
}

struct K {
    l: L;
}

struct J {
    k: K;
}

struct I {
    j: J;
}

contract Test23 {
    val: I;

    init() {
        self.val = I{
            j: J{ k: K{ l: L{ m: M{ n: N{ s: "deep" } } } } }
        };
    }
}
