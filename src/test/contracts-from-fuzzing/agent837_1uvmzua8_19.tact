struct InnerA { x: Int; }
struct InnerB { y: Int?; }

struct Out {
    a: InnerA;
    b: InnerB;
    flag: Bool;
}

contract ComboNest {
    val: Out;
    init() {
        self.val = Out{
            a: InnerA{ x: 10 },
            b: InnerB{ y: null },
            flag: true,
        };
    }
}