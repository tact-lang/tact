struct OptionalInner {
    z: Int;
}

struct HasOptional {
    maybe: OptionalInner?;
}

contract OptionalFieldContract {
    data: HasOptional;

    init() {
        self.data = HasOptional { maybe: null };
    }
}