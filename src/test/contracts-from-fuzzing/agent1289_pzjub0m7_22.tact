struct LeafA { val: Int; }
struct LeafB { flag: Bool; }
struct LeafC { text: String; }

struct BigNest {
    a: LeafA;
    b: LeafB;
    c: LeafC;
}

contract BigNestedStructTest {
    data: BigNest;

    init() {
        self.data = BigNest{
            a: LeafA{ val: 1 },
            b: LeafB{ flag: true },
            c: LeafC{ text: "ok" }
        };
    }
}