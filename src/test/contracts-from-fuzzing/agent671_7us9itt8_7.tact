struct Small {
    value: Int;
}

struct Mid {
    maybeSmall: Small?;
}

struct Big {
    m: Mid;
    label: String;
}

contract TestContract {
    store: Big;

    init() {
        self.store = Big{
            m: Mid{ maybeSmall: null },
            label: "nested opt struct"
        };
    }
}