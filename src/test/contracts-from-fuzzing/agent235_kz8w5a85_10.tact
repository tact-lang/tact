struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

struct OptionalWrapper {
    wrapped: OptionalInner?;
}

contract OptWrapContract {
    f: OptionalWrapper;

    init() {
        self.f = OptionalWrapper{
            wrapped: OptionalInner{
                foo: null,
                bar: true
            }
        };
    }
}