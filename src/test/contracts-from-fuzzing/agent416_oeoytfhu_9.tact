struct OptA {
    a: Int?;
}

struct OptB {
    b: Bool?;
}

struct Combo {
    oa: OptA;
    ob: OptB;
}

contract Test10 {
    val: Combo;

    init() {
        self.val = Combo{
            oa: OptA{ a: null },
            ob: OptB{ b: true }
        };
    }
}
