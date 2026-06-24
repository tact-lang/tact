struct NestedStructOptional {
    inner: MaybeInner?;
}

struct MaybeInner {
    number: Int?;
    message: String?;
}

contract TestDeepOptional {
    store: NestedStructOptional;

    init() {
        self.store = NestedStructOptional{
            inner: MaybeInner{
                number: 123,
                message: "hello"
            }
        };
    }
}