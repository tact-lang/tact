struct Alpha {
    a: Int;
}
struct Beta {
    b: Alpha;
}
struct Gamma {
    c: Beta;
}

contract TestContract {
    vals: Gamma?; // optional nested struct

    init() {
        self.vals = Gamma{
            c: Beta{
                b: Alpha{ a: 77 },
            },
        };
    }
}