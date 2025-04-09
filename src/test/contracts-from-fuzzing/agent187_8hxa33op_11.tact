struct SOptDeep {
    inner2: SOptInner?;
}

struct SOptInner {
    s: String;
    b: Bool;
}

contract NestedOptionalStructField {
    s: SOptDeep;
    init() {
        self.s = SOptDeep{
            inner2: SOptInner{
                s: "abc",
                b: false,
            },
        };
    }
}
