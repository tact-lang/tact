struct ManyBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract ManyBools {
    data: ManyBool;
    init() {
        self.data = ManyBool{
            a: true, b: false, c: true, d: false, e: true, f: false, g: true, h: false
        };
    }
}
