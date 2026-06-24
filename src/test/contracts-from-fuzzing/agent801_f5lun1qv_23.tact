struct Alpha {
    x: Int?;
    y: Int;
}

struct Beta {
    a: Alpha?;
    b: Alpha;
}

contract OptionalMix {
    pair: Beta;

    init() {
        self.pair = Beta{
            a: Alpha{ x: null, y: 0 },
            b: Alpha{ x: 4, y: 5 },
        };
    }
}