struct OptionalInner {
    value: String?;
    flag: Bool?;
}

struct OptionalWrapper {
    inner: OptionalInner?;
    number: Int;
}

contract OptionalNested {
    state: OptionalWrapper;

    init() {
        self.state = OptionalWrapper{
            inner: OptionalInner{
                value: "hi",
                flag: true,
            },
            number: 999,
        };
    }
}