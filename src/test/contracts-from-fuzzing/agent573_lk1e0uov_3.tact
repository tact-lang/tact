struct NestedOptionalInner {
    x: Int?;
    flag: Bool?;
    text: String?;
}

struct NestedOptional {
    inner: NestedOptionalInner?;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: NestedOptionalInner{
                x: null,
                flag: true,
                text: null
            }
        };
    }
}
