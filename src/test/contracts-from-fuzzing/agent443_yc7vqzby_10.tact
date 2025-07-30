struct OptionalDeep {
    inner: Int?;
    flag: Bool?;
    text: String?;
}

struct NestedOptional {
    opt: OptionalDeep;
    num: Int;
}

contract OptionalDeepTest {
    st: NestedOptional;

    init() {
        self.st = NestedOptional{
            opt: OptionalDeep{
                inner: null,
                flag: null,
                text: "hello"
            },
            num: 77
        };
    }
}