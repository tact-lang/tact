struct VeryDeep {
    v1: Int;
    v2: Bool;
}

struct Inbetween {
    fieldA: VeryDeep;
    fieldB: VeryDeep;
}

struct MoreNesting {
    nest1: Inbetween;
    nest2: Inbetween;
}

struct Topmost {
    deepnest: MoreNesting;
    flag: Bool;
}

contract CrazyNesting {
    state: Topmost;

    init() {
        self.state = Topmost{
            deepnest: MoreNesting{
                nest1: Inbetween{
                    fieldA: VeryDeep{v1: 1, v2: true},
                    fieldB: VeryDeep{v1: 2, v2: false}
                },
                nest2: Inbetween{
                    fieldA: VeryDeep{v1: 3, v2: true},
                    fieldB: VeryDeep{v1: 4, v2: false}
                }
            },
            flag: true
        };
    }
}