struct MixOptDefaults {
    x: Int?;
    y: Bool = false;
    z: String?;
}

contract MixTest {
    data: MixOptDefaults;
    
    init() {
        self.data = MixOptDefaults{
            x: 111,
            z: null,
        };
    }
}
