struct Sub {
    s1: Int?;
    s2: String;
    s3: Bool;
}

contract NullableNested {
    inner: Sub?;

    init() {
        self.inner = null;
    }

    receive() {
        self.inner = Sub{s1: 1, s2: "x", s3: true};
    }
}
