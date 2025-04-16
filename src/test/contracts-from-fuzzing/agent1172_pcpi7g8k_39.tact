struct MixDefaultsOpts {
    a: Int = 11;
    b: String?;
    c: Bool?;
}

contract MixTest {
    val: MixDefaultsOpts;

    init() {
        self.val = MixDefaultsOpts{
            b: null,
            c: null
        };
    }
}