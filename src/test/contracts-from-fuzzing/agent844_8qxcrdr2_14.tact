struct LeafA { a: Int }
struct LeafB { b: Bool }
struct LeafC { c: String }

struct Compound1 {
    la: LeafA;
    lb: LeafB;
}

struct Compound2 {
    lc: LeafC;
    opt: Int?;
}

struct Root {
    c1: Compound1;
    c2: Compound2;
}

contract TreeContract {
    root: Root;

    init() {
        self.root = Root{
            c1: Compound1{
                la: LeafA{a:1},
                lb: LeafB{b:false},
            },
            c2: Compound2{
                lc: LeafC{c:"x"},
                opt: null,
            },
        };
    }

    receive() {
        let _ = self.root;
    }
}
