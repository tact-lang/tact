struct Mix {
    a: Int?;
    b: Bool;
    c: String?;
    d: Address;
    e: Bool?;
    f: Int;
}

contract MixTest {
    mix: Mix;

    init() {
        self.mix = Mix{ a: null, b: false, c: null, d: myAddress(), e: null, f: 42 };
    }
}
