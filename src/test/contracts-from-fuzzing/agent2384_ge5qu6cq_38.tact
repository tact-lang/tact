struct MixOptDefaults {
    a: Int?;
    b: Bool = true;
    c: Int = 5;
    d: Bool?;
}

contract MixOptDefaultTest {
    storage: MixOptDefaults;

    init() {
        self.storage = MixOptDefaults{a:null,d:null};
    }
}