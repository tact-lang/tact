struct Nasty {
    a: Int;
    b: Bool?;
    c: Int?;
    d: Bool;
    e: Int;
    f: Bool?;
    g: Int?;
    h: Bool;
    i: Int;
}

contract NastyFields {
    nf: Nasty;

    init() {
        self.nf = Nasty{
            a: 1, b: null, c: null, d: true, e: 5, f: null, g: null, h: false, i: 10
        };
    }

    receive() {
        self.nf = Nasty{
            a: 2, b: true, c: 42, d: false, e: 6, f: false, g: 100, h: true, i: 20
        };
    }
}