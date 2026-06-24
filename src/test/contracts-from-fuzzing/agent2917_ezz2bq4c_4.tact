struct MixedOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalsInStruct {
    stored: MixedOptionals;

    init() {
        self.stored = MixedOptionals{x: null, y: true, z: null};
    }
}
