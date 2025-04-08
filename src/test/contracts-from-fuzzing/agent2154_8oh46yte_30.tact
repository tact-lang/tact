struct MixDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Int?;
    e: String?;
}

contract DefaultsTest {
    m: MixDefaults;

    init() {
        self.m = MixDefaults{d:null,e:"xyz"};
    }
}