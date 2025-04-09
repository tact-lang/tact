struct NestedOptional {
    flag: Bool?;
    num: Int?;
    text: String?;
}

struct ContainsOptional {
    inner: NestedOptional;
    number: Int;
}

contract OptionTest {
    val: ContainsOptional;

    init() {
        self.val = ContainsOptional{
            inner: NestedOptional{
                flag: null,
                num: 123,
                text: null,
            },
            number: 77,
        };
    }
}