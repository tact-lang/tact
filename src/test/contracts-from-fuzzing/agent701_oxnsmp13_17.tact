struct MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "hi";
}

contract StructWithMixedDefaults {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            a: 2,
            b: true,
            c: "bye"
        };
    }
}