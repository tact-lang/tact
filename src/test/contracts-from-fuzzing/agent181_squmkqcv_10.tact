struct Alpha {
    x: Int;
}

struct Beta {
    y: Int;
}

struct Gamma {
    a: Alpha;
    b: Beta;
}

struct Delta {
    g: Gamma;
}

contract TestDeepStructs {
    inner: Delta;

    init() {
        self.inner = Delta{
            g: Gamma{
                a: Alpha{ x: 1 },
                b: Beta{ y: 2 },
            },
        };
    }
}
