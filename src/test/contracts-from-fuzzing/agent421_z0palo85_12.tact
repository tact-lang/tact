struct OptionalInDeep {
    nested: Int?;
}

struct HasDeepOpt {
    inner: OptionalInDeep;
}

contract InnerOptionalTest {
    data: HasDeepOpt;
    init() {
        self.data = HasDeepOpt{
            inner: OptionalInDeep{
                nested: null
            }
        };
    }
}