struct OptionalAndNonOptional {
    x: Int;
    y: Bool?;
    z: String;
}

contract OptionalMix {
    data: OptionalAndNonOptional;

    init() {
        self.data = OptionalAndNonOptional{
            x: 11,
            y: null,
            z: "end"
        };
    }
}