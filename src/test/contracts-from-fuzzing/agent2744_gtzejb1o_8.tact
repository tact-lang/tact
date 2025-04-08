struct MultipleBools {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
}

contract ManyBoolsContract {
    flags: MultipleBools;

    init() {
        self.flags = MultipleBools{
            b1: true,
            b2: false,
            b3: true,
            b4: false,
            b5: true
        };
    }
}
