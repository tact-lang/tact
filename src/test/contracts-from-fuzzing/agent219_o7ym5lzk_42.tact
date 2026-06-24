struct Alpha { v: Int; }
struct Beta { w: Int; }

struct Gamma {
    a: Alpha;
    b: Beta;
    optInt: Int?;
}

contract CompositeABC {
    g: Gamma;

    init() {
        self.g = Gamma{
            a: Alpha{ v: 1 },
            b: Beta{ w: 2 },
            optInt: null
        };
    }
}