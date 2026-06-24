struct TypeMix {
    x: Int;
    y: Bool;
    z: Int?;
    s: String;
    t: String?;
}

contract MixedTest {
    tm: TypeMix;
    init() {
        self.tm = TypeMix {
            x: 1,
            y: true,
            z: null,
            s: "hi",
            t: null
        };
    }
}