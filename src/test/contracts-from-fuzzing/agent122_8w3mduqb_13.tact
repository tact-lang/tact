struct NullableNested {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract OptionalComposite {
    s: NullableNested? = null;
    init() {
        self.s = NullableNested{
            x: 42,
            y: true,
            z: null,
        };
    }
}
