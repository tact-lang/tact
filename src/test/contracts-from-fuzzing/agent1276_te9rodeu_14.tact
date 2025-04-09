struct Lvl3 {
    v3: String;
}

struct Lvl2 {
    v2: Lvl3;
}

struct Lvl1 {
    v1: Lvl2;
}

struct Root {
    lvl: Lvl1;
}

contract TripleNested {
    n: Root;

    init() {
        self.n = Root{
            lvl: Lvl1{
                v1: Lvl2{
                    v2: Lvl3{ v3: "deep" }
                }
            }
        };
    }
}