struct DeepFinal {
    z: String;
}

struct Middle {
    inner: DeepFinal;
}

struct Wrapper {
    middle: Middle;
}

struct NestedOptWrap {
    maybeWrap: Wrapper?;
    i: Int;
}

contract OptNestedWrap {
    store: NestedOptWrap;

    init() {
        self.store = NestedOptWrap{
            maybeWrap: null,
            i: 7,
        };
    }
}