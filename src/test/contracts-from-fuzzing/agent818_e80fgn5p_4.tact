struct OptionalNested {
    inner: OptionalInner?;
}

struct OptionalInner {
    flag: Bool;
    text: String?;
}

contract OptionalContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: null
        };
    }
}