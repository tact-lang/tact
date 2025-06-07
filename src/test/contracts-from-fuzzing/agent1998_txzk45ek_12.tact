struct S {
    n: Int;
    b: Bool;
}

contract OptionalStructField {
    optS: S?;

    init() {
        self.optS = S{
            n: 12,
            b: true
        };
    }
}