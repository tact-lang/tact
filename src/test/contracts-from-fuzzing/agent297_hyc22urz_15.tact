struct BigOptional {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
    e: Bool?;
    f: Bool?;
    g: Bool?;
    h: Bool?;
    i: Bool?;
    j: Bool?;
}

contract TestContract {
    data: BigOptional;

    init() {
        self.data = BigOptional{
            a: null, b: true, c: false, d: null, e: true,
            f: null, g: false, h: null, i: true, j: null
        };
    }
}