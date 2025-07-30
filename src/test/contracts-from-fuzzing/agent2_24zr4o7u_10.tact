struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

struct Wrap {
    inner: OptionalFields?;
}

contract OptionalWrap {
    state: Wrap;

    init() {
        self.state = Wrap{
            inner: null
        };
    }
}