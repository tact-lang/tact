struct S1 {
    f1: Int;
    f2: Int?;
    f3: String;
    f4: Bool?;
    f5: Slice;
}

struct S2 {
    inner: S1;
    extra: Int;
}

contract Combo {
    v: S2;
    init() {
        self.v = S2 {
            inner: S1 {
                f1: 5,
                f2: null,
                f3: "hi",
                f4: true,
                f5: emptyCell().asSlice(),
            },
            extra: 10
        };
    }
}