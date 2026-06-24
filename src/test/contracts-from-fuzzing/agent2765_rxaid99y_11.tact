struct S1 {
    x: Int?;
}

struct S2 {
    s: S1?;
}

contract NullableNested {
    data: S2;

    init() {
        self.data = S2 {
            s: null
        };
    }
}