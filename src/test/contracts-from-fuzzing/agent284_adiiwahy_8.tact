struct EmbeddedDefaults {
    x: Int = 5;
    y: Int = 15;
    z: String = "abc";
}

struct Container {
    inner: EmbeddedDefaults;
}

contract DefaultsNested {
    data: Container;

    init() {
        self.data = Container{
            inner: EmbeddedDefaults{}
        };
    }
}