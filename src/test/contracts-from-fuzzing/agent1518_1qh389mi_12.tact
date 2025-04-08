struct MultiBool {
    b1: Bool;
    b2: Bool;
    b3: Bool?;
    b4: Bool?;
}

contract ManyBools {
    s: MultiBool;

    init() {
        self.s = MultiBool{
            b1: true,
            b2: false,
            b3: null,
            b4: true
        };
    }
}