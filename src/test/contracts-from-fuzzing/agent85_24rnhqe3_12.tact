struct Small {
    a: Int;
}

struct Medium {
    small1: Small;
    small2: Small;
}

struct Big {
    medium1: Medium;
    medium2: Medium;
}

contract TestContract {
    big: Big;
    init() {
        self.big = Big{
            medium1: Medium{
                small1: Small{a: 1},
                small2: Small{a: 2}
            },
            medium2: Medium{
                small1: Small{a: 3},
                small2: Small{a: 4}
            }
        };
    }
}