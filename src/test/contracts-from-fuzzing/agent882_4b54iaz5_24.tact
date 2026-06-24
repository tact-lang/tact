struct StringPair {
    a: String;
    b: String;
}

struct Wrap {
    inner: StringPair?;
}

contract OptionalStructNested {
    f: Wrap;

    init() {
        self.f = Wrap{
            inner: null
        };
    }
}