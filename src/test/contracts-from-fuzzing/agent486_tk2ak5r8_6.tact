struct OptionalNested {
    inner: OptionalInner;
}

struct OptionalInner {
    val: Int?;
    flag: Bool?;
    text: String?;
}

contract TestOptionalNested {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: OptionalInner{
                val: null,
                flag: null,
                text: null
            }
        };
    }
}