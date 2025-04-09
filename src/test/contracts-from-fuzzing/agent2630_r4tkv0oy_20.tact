struct MultipleBooleans {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
}

contract ManyBools {
    flags: MultipleBooleans;

    init() {
        self.flags = MultipleBooleans{
            b1: true, b2: false, b3: true, b4: false, b5: true
        };
    }
}