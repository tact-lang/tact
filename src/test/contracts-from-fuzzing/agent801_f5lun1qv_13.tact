struct EmbeddedWithDefaults {
    a: Int = 11;
    b: Int?;
    c: Bool = true;
    d: Bool?;
}

struct Container {
    e: EmbeddedWithDefaults;
    f: EmbeddedWithDefaults;
}

contract ContainerDefaults {
    storage: Container;

    init() {
        self.storage = Container{
            e: EmbeddedWithDefaults{ b: 22, d: null },
            f: EmbeddedWithDefaults{ b: null, d: false }
        };
    }
}