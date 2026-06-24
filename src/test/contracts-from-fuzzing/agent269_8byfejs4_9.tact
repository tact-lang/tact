struct Alpha {
    a: Int;
}
struct Beta {
    b: Int;
    nestedA: Alpha;
}
struct Gamma {
    c: Beta;
}

contract CrossNest {
    store: Gamma;

    init() {
        self.store = Gamma{
            c: Beta{
                b: 55,
                nestedA: Alpha{ a: 77 }
            }
        };
    }
}