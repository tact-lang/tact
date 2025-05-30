struct InnerOpt {
    val: Int?;
}

struct HasNestedOptional {
    inner: InnerOpt?;
    flag: Bool;
}

contract NestedOptionalStructStorage {
    data: HasNestedOptional;

    init() {
        self.data = HasNestedOptional{
            inner: null,
            flag: true,
        };
    }
}
