struct Inner {
    n: Int;
    b: Bool;
    s: String;
    opt: Bool?;
}

contract Test {
    innerField: Inner;

    init() {
        self.innerField = Inner{
            n: 1, b: false, s: "abc", opt: true
        };
    }
}
// Mixed primitive types and optional inside nested struct field