struct SubNested {
    z: Int = 99;
}

struct HasDefaults {
    x: Int = 42;
    y: Bool = true;
    s: SubNested;
}

contract DefaultsTest {
    f: HasDefaults;

    init() {
        self.f = HasDefaults{
            s: SubNested{}
        };
    }
}