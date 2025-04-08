struct Flags {
    a: Bool = true;
    b: Bool = false;
    c: Bool = true;
}

struct Settings {
    level: Int as uint4 = 3;
    flags: Flags;
    tag: String? = null;
}

contract NestedMixed {
    params: Settings = Settings{
        level: 2,
        flags: Flags{ a: false, b: true, c: false },
        tag: "config"
    };

    init() {
        self.params = Settings{
            level: 1,
            flags: Flags{ a: true, b: true, c: true },
            tag: null
        };
    }
}