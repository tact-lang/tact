struct Larger {
    a: Int;
    b: String;
    c: Int;
    d: Bool;
    e: Int;
    f: String;
    g: Int;
    h: Bool;
    i: Int;
    j: String;
    k: Bool;
    l: Int;
    m: String;
    n: Int;
    o: Bool;
}

contract TestContract {
    var: Larger;
    init() {
        self.var = Larger{
            a: 1,
            b: "b",
            c: 2,
            d: true,
            e: 3,
            f: "f",
            g: 4,
            h: false,
            i: 5,
            j: "j",
            k: true,
            l: 6,
            m: "m",
            n: 7,
            o: false,
        };
    }
}
