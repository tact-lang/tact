struct Base {
    i: Int as uint8;
    s: String = "base";
    b: Bool = true;
    o: Int? = null;
}

struct Wrap {
    label: String = "wrap";
    nested: Base;
    flag: Bool = false;
    extra: Int?;
}

contract TestContract {
    store: Wrap;

    init() {
        self.store = Wrap{
            nested: Base{ i: 5, o: null },
            extra: 123
        };
    }
}