struct MixedOpts {
    x: Int?;
    y: Bool?;
    z: String?;
    a: Address?;
}

contract MixedOptionStructPersist {
    value: MixedOpts;

    init() {
        self.value = MixedOpts{ x: null, y: null, z: null, a: null };
    }
}