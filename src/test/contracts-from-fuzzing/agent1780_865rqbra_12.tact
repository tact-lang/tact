struct InnerDefaults {
    a: Int? = null;
    b: Bool? = true;
}

struct MidDefaults {
    inner: InnerDefaults;
}

contract DefaultsCascade {
    data: MidDefaults;

    init() {
        self.data = MidDefaults{
            inner: InnerDefaults{}  // rely solely on defaults
        };
    }
}