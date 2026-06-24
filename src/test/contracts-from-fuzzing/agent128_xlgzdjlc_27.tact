struct MixDefaults {
    a: Int = 1;
    b: Int?;
    c: Bool = true;
    d: Bool?;
}

contract TestContract {
    val: MixDefaults;

    init() {
        self.val = MixDefaults{
            b: null,
            d: false
        };
    }
}