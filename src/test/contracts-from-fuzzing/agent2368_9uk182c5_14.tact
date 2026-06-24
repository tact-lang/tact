struct One { x: Int; }
struct Two { y: Int; }
struct Three { z: Int; }

struct Bundle {
    fst: One?;
    snd: Two?;
    trd: Three?;
}

contract OptionalBundle {
    storage: Bundle;

    init() {
        self.storage = Bundle{
            fst: One{ x: 100 },
            snd: null,
            trd: Three{ z: 300 }
        };
    }
}