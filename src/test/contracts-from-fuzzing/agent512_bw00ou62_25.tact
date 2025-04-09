struct DefaultsOverride {
    a: Int = 1;
    b: Bool = false;
}

contract DefaultsOverrideTest {
    data: DefaultsOverride;

    init() {
        self.data = DefaultsOverride{
            a: 5,
            b: true
        };
    }
}