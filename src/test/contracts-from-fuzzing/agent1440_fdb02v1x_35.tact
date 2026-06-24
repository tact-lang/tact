struct CompositeFields {
    s: String;
    flag: Bool;
    opt: Int?;
}

contract CompositeContract {
    a: CompositeFields;
    b: CompositeFields;

    init() {
        self.a = CompositeFields{ s: "one", flag: true, opt: 1 };
        self.b = CompositeFields{ s: "two", flag: false, opt: null };
    }
}