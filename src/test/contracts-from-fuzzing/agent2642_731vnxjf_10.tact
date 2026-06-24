struct ComposeA {
    ix: Int;
    iy: Int?;
}

struct ComposeB {
    sx: String;
    sy: String?;
}

struct ComposeOuter {
    a: ComposeA;
    b: ComposeB;
    ok: Bool;
}

contract BigNested {
    record: ComposeOuter;
    init() {
        self.record = ComposeOuter{
            a: ComposeA{ ix: 1, iy: null },
            b: ComposeB{ sx: "foo", sy: null },
            ok: true,
        };
    }
}