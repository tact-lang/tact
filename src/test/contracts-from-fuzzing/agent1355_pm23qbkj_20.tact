struct OptionalMix {
    a: Bool?;
    b: Int?;
    c: String?;
}
contract OptLayer {
    f: OptionalMix;
    init() {
        self.f = OptionalMix{
            a: true,
            b: null,
            c: "yo"
        };
    }
}