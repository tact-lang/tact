struct MixDefault {
    a: Int = 5;
    b: Int?;
    c: Bool = true;
    d: String?;
}

contract MixDefTest {
    st: MixDefault;
    init() {
        self.st = MixDefault{
            b: null,
            d: null,
        };
    }
}