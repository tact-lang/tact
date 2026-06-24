struct WithDefaults {
    x: Int = 5;
    y: Bool = true;
}

struct AllNullables {
    p: Int?;
    q: String?;
}

struct ComboStructMix {
    d: WithDefaults;
    n: AllNullables;
}

contract ComboDefaultsNulls {
    data: ComboStructMix;

    init() {
        self.data = ComboStructMix{
            d: WithDefaults{},
            n: AllNullables{ p: null, q: null },
        };
    }
}