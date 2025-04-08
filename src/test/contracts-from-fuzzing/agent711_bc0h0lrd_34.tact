struct DefaultAndSerialized {
    a: Int = 1;
    b: Int as uint8;
}

contract MixDefaultsSerial {
    s: DefaultAndSerialized;

    init() {
        self.s = DefaultAndSerialized{
            b:42
        };
    }
}
