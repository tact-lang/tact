struct MixedOptional {
    x: Int?;
    y: Bool;
    z: String?;
}

contract StructWithMixedOptional {
    data: MixedOptional;

    init() {
        self.data = MixedOptional{
            x: null,
            y: true,
            z: null
        };
    }
}