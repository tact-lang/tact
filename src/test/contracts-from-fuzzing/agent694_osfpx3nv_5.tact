struct Large {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
}

contract TestContract {
    data: Large;

    init() {
        self.data = Large{
            a: 1, b: false, c: "c", d: 4, e: true, f: "f",
            g: 7, h: true, i: "i", j: 10, k: false, l: "l"
        };
    }
}