struct MixDefaults {
    x: Int = 1;
    y: Int?;
    z: Bool? = false;
}

contract PartialDefaults {
    val: MixDefaults;

    init() {
        self.val = MixDefaults{ y: null };
    }
}