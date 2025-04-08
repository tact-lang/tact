struct InnerD {
    d: Int?;
}

struct MiddleB {
    b: InnerD?;
}

struct OuterA {
    a: MiddleB?;
}

contract NullAllOpt {
    val: OuterA;

    init() {
        self.val = OuterA{ a: null };
    }
}