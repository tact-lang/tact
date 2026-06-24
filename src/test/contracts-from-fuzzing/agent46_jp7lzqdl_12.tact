struct Alpha {
    a: Int;
}

struct Beta {
    b: Int;
    a: Alpha;
}

struct Gamma {
    g: Beta;
    flag: Bool;
    text: String?;
}

contract MixIt {
    data: Gamma;

    init() {
        self.data = Gamma{
            g: Beta{
                b: 5,
                a: Alpha{a: 1},
            },
            flag: true,
            text: null,
        };
    }
}
