// Two deep optional chains with heterogenous inner structures
struct LeafA { x: Int?; }
struct LeafB { y: String?; }

struct Mid {
    a: LeafA?;
    b: LeafB?;
}

contract HeteroOpt {
    data: Mid;

    init() {
        self.data = Mid{ a: null, b: null };
    }
}
