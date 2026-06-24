struct Big {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
    k: Bool;
    l: String;
}

contract LargeContract {
    data: Big;

    init() {
        self.data = Big{
            a: 1, b: true, c: "1",
            d: 2, e: false, f: "2",
            g: 3, h: true, i: "3",
            j: 4, k: false, l: "4"
        };
    }
}