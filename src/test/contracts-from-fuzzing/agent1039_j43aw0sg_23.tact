struct Complex {
    s: Small;
    t: Small;
    u: Small;
    opt: Small?;
}

struct Small {
    x: Int;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            s: Small{x:1},
            t: Small{x:2},
            u: Small{x:3},
            opt: null
        };
    }
}