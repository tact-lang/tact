struct S1 {
    x: Int;
    y: Bool?;
}

struct S2 {
    a: S1?;
    b: String;
}

contract DoubleOptionalStructs {
    val: S2;

    init() {
        self.val = S2{
            a: null,
            b: "s"
        };
    }
}