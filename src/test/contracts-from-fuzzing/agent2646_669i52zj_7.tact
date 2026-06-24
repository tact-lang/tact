struct OptionalLayers {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructFields {
    f: OptionalLayers;
    init() {
        self.f = OptionalLayers{
            a: null,
            b: true,
            c: null
        };
    }
    receive() {}
}