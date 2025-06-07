struct NestedOptionals {
    inner: InnerOptional?;
}

struct InnerOptional {
    val: Int?;
    flag: Bool?;
    text: String?;
}

contract NestedOptionalFields {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            inner: InnerOptional{
                val: null,
                flag: false,
                text: "hi",
            },
        };
    }
}
