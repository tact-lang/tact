struct Mixed {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
}

contract TestContract {
    m: Mixed;

    init() {
        self.m = Mixed{
            a: 1, b: true, c: null, d: false,
            e: 5, f: false, g: 7, h: null
        };
    }
}