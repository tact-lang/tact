struct OptionalNested {
    maybeNum: Int?;
    maybeBool: Bool?;
    inner: InnerOpt;
}

struct InnerOpt {
    val: Int?;
    flag: Bool?;
}

contract OptionalNestedContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            maybeNum: 123,
            maybeBool: null,
            inner: InnerOpt{
                val: null,
                flag: true
            }
        };
    }
}
