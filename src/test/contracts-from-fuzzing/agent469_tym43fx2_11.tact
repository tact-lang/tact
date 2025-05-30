struct S1 {
    x: Int?;
    y: Int;
}

struct S2 {
    s1: S1?;
}

contract OptionalLayered {
    val: S2;

    init() {
        self.val = S2{
            s1: S1 {
                x: null,
                y: 99
            }
        };
    }
}