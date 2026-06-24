struct OptionalDeep {
    nested: OptionalMid?;
}

struct OptionalMid {
    value: Int;
}

contract OptDeep {
    store: OptionalDeep;

    init() {
        self.store = OptionalDeep{
            nested: null
        };
    }
}