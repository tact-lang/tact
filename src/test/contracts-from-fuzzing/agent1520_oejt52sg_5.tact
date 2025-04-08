struct Alpha {
    s: String;
    n: Int;
}

struct Beta {
    a: Alpha;
    m: String;
}

struct Gamma {
    b: Beta;
    c: Bool;
}

contract DeepFlat {
    persist: Gamma;

    init() {
        self.persist = Gamma{
            b: Beta{
                a: Alpha{
                    s: "xyz",
                    n: 1
                },
                m: "middle"
            },
            c: true
        };
    }
}
