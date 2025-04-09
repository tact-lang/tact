struct SMin {
    a: Int;
}

struct SMed {
    s: SMin;
    b: Bool;
}

struct SLarge {
    nested: SMed;
    str: String;
    ok: Bool?;
}

contract NestedTest {
    big: SLarge;

    init() {
        self.big = SLarge{
            nested: SMed{
                s: SMin{a: 42},
                b: false,
            },
            str: "test",
            ok: null,
        };
    }
}