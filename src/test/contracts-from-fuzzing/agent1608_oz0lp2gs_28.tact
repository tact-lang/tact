// same as previous but flipping optionals
struct C { d: Int; }
struct D { e: Bool; }
struct OptOuterNested {
    sc: C;
    sd: D;
}

contract NonOptOuterNested {
    field: OptOuterNested?;

    init() {
        self.field = OptOuterNested{
            sc: C{ d: 3 },
            sd: D{ e: false }
        };
    }
}