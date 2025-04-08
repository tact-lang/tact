struct LeafA {
    x: Int?;
    y: Bool;
}

struct LeafB {
    s: String?;
    z: Int as uint10;
}

struct Branch {
    a: LeafA;
    b: LeafB;
}

contract TestContract {
    data: Branch;

    init() {
        self.data = Branch{
            a: LeafA{ x: null, y: true },
            b: LeafB{ s: null, z: 512 },
        };
    }
}