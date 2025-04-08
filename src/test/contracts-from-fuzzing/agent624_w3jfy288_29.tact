struct MixedDefaults {
    a: Int = 50;
    b: Bool;
    c: String = "hi";
}

contract PartialStructInit {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            b: true
        };
    }
}