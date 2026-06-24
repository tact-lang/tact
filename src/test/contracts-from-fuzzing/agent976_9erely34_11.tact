struct MixDefaults {
    a: Int = 5;
    b: Int;
    c: Int = 10;
}

contract PartialStructInit {
    data: MixDefaults;
    init() {
        self.data = MixDefaults{ b: 42 };
    }
}