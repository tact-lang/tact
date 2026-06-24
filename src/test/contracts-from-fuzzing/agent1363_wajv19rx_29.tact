struct ManyBoolOpts {
    b1: Bool? = null;
    b2: Bool? = null;
    b3: Bool? = null;
    b4: Bool? = null;
    b5: Bool? = null;
    b6: Bool? = null;
}

contract NullDefaultsOverride {
    data: ManyBoolOpts;

    init() {
        self.data = ManyBoolOpts{
            b1: true,
            b2: false,
            b3: null,
            b4: true,
            b5: null,
            b6: false,
        };
    }
}