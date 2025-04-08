struct OptionalStruct {
    name: String;
    maybeNumber: Int?;
}

struct Wrap {
    inner: OptionalStruct?;
}

contract NullableWrap {
    payload: Wrap;

    init() {
        self.payload = Wrap{ inner: null };
    }
}