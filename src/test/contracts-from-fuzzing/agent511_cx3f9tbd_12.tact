struct OptionalInner {
    value: Int;
    name: String;
}

struct HasOptionalInner {
    maybe: OptionalInner?;
}

contract TestContract {
    data: HasOptionalInner;

    init() {
        self.data = HasOptionalInner{
            maybe: null
        };
    }
}