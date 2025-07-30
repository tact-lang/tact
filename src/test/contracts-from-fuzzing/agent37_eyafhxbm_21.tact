struct Alpha {
    a: Int;
}

struct Beta {
    b: Bool;
}

struct Gamma {
    g: String;
}

struct Delta {
    alpha: Alpha;
    beta: Beta;
    gamma: Gamma;
}

contract TestContract {
    d: Delta = Delta{
        alpha: Alpha{a:1},
        beta: Beta{b:true},
        gamma: Gamma{g:"hi"}
    };

    init() {
        self.d = Delta{
            alpha: Alpha{a:10},
            beta: Beta{b:false},
            gamma: Gamma{g:"bye"}
        };
    }
    receive() {}
}