struct S {
    a: Int = 1;
    b: Bool?;
    c: String = "text";
    d: Int?;
}

contract OptionalDefaultMix {
    val: S;

    init() {
        self.val = S{
            a: 42,
            b: null,
            c: "hi",
            d: null
        };
    }
}