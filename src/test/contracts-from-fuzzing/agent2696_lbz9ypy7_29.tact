struct InnerDefault {
    x: Int = 5;
}
struct OuterDefault {
    y: InnerDefault = InnerDefault{};
}

contract DefaultsChain {
    f: OuterDefault;
    init() {
        self.f = OuterDefault{};
    }
}