struct SerializeOptional {
    a: Int? as uint4;
    b: Bool?;
}

contract OptionalSerialization {
    state: SerializeOptional;
    init() {
        self.state = SerializeOptional{a: null, b: null};
    }
}