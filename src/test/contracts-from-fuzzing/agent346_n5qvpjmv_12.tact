struct MultipleOptionals {
    x: Int?;
    y: Bool?;
    z: Int?;
}

contract OptionalGroup {
    m: MultipleOptionals;

    init() {
        self.m = MultipleOptionals{
            x: null,
            y: null,
            z: null
        };
    }
}