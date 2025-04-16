struct S1 {
    i: Int?;
    s: String?;
}

struct S2 {
    one: S1?;
    two: Int?;
}

contract DeepOptionals {
    val: S2;

    init() {
        self.val = S2{
            one: S1{ i: 10, s: null },
            two: null,
        };
    }
}