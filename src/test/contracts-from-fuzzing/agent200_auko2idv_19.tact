struct StringOpt {
    a: String?;
    b: String?;
    c: String?;
}

contract TestStrOpt {
    data: StringOpt;
    init() {
        self.data = StringOpt{
            a: null,
            b: "hello",
            c: null
        };
    }
}