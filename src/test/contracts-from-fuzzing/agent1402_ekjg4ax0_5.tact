struct Inner {
    a: Int;
    b: Bool;
    s: String;
}

contract OnlyOptionalField {
    param: Inner?;

    init() {
        self.param = Inner{a: 1, b: true, s: "hi"};
    }
}