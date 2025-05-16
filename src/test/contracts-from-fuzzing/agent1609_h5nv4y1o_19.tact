// nested deep contract with optionals and serialization
struct Alpha {
    a: Int? as int8;
    b: Bool?;
}
struct Beta {
    alpha: Alpha?;
    c: Int as uint32;
}
struct Gamma {
    beta: Beta?;
    d: Bool?;
}

contract TestContract {
    gamma: Gamma?;

    init() {
        self.gamma = Gamma{
            beta: Beta{
                alpha: Alpha{
                    a: null,
                    b: false
                },
                c: 77
            },
            d: true
        };
    }

    receive() {
        self.gamma = null;
    }
}