struct OptionalDeep {
    x: Int?;
    y: Bool?;
    z: OptionalInnerDeep?;
}

struct OptionalInnerDeep {
    a: Int?;
    b: Bool?;
}

contract OptionalDeepContract {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            x: null,
            y: true,
            z: OptionalInnerDeep{ a: 9, b: null }
        };
    }
}
