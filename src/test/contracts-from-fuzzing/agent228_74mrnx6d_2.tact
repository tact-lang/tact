struct NestedOptional {
    inner: String?;
    number: Int?;
    flag: Bool?;
}

contract TestNestedOpt {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{
            inner: "hi",
            number: null,
            flag: true
        };
    }
}