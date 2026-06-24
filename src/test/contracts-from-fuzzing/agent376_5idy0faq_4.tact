struct Deep {
    foo: Int;
    bar: Bool;
    baz: String?;
    deeper: Deeper?;
}

struct Deeper {
    value: Int;
    label: String;
}

contract OptionalDeepNested {
    payload: Deep?;

    init() {
        self.payload = null;
    }
}