struct OptionalString {
    comment: String?;
}

struct OuterOptionalHolder {
    inner: OptionalString?;
    num: Int;
}

contract OptionalStructs {
    storage: OuterOptionalHolder;

    init() {
        self.storage = OuterOptionalHolder{
            inner: null,
            num: 42,
        };
    }
}
