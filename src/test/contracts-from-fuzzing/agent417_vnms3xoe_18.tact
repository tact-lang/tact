struct DefaultNested {
    x: Int = 5;
}

struct Wrap {
    nested: DefaultNested = DefaultNested{};
    y: Int = 10;
}

contract WithDefaults {
    persist: Wrap;

    init() {
        self.persist = Wrap{};
    }
}