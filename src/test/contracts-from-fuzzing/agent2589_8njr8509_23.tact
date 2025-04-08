struct DefaultOptional {
    v1: Int? = null;
    v2: Bool? = null;
}

contract OptionalDefaults {
    data: DefaultOptional;

    init() {
        self.data = DefaultOptional{
            v1: null,
            v2: null,
        };
    }
}