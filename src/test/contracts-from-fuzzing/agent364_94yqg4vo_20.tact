struct OptWithSerialize {
    quality: Int as uint32;
}

struct OuterOpt {
    data: OptWithSerialize?;
}

contract PartialOptSerialize {
    nested: OuterOpt;

    init() {
        self.nested = OuterOpt{};  // omit optional, defaults to null
    }
}