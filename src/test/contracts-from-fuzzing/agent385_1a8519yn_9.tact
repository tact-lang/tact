struct OptionalMix {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract MultiOptional {
    data: OptionalMix;

    init() {
        self.data = OptionalMix{
            i: null,
            b: true,
            s: null
        };
    }
}
