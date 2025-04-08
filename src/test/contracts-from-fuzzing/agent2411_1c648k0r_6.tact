struct Alpha {
    beta: Beta;
}

struct Beta {
    gamma: Gamma;
}

struct Gamma {
    delta: Delta;
}

struct Delta {
    value: Int;
}

contract ChainStorage {
    store: Alpha;

    init() {
        self.store = Alpha{
            beta: Beta{
                gamma: Gamma{
                    delta: Delta{
                        value: 777
                    }
                }
            }
        };
    }
}