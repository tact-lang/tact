struct LargeNestA {
    x: LargeNestB;
    y: Int;
}

struct LargeNestB {
    u: LargeNestC;
    v: String;
}

struct LargeNestC {
    f: Int;
    g: Bool;
}

contract TestContract {
    nest: LargeNestA;

    init() {
        self.nest = LargeNestA{
            x: LargeNestB{
                u: LargeNestC{ f: 1, g: true },
                v: "test",
            },
            y: 2,
        };
    }
}
