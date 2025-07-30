struct OptionalDeep {
    x: Int?;
    inner: InnerOptional?;
}

struct InnerOptional {
    y: Bool?;
    z: Address?;
}

contract OptionalDeepContract {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{ x: null, inner: null };
    }
}