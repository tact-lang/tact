struct InnerDefault {
    x: Int = 123;
}

struct OuterWithDefaults {
    inner: InnerDefault = InnerDefault{};
}

contract DefaultsInNested {
    o: OuterWithDefaults;
    init() {
        self.o = OuterWithDefaults{};
    }
}