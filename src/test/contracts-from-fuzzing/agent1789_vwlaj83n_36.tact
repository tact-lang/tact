struct Combined {
    a: Int?;
    b: Bool;
    c: String?;
}

contract OptMixedSeparate {
    val: Combined;

    init() {
        self.val = Combined{
            a: null,
            b: false,
            c: null
        };
    }
}