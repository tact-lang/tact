struct S1 {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String;
    g: Int;
    h: String?;
    i: Int;
    j: Bool;
}

contract TestContract {
    val: S1;

    init() {
        self.val = S1{
            a: 1,
            b: null,
            c: "c",
            d: null,
            e: true,
            f: "f",
            g: 7,
            h: null,
            i: 9,
            j: false,
        };
    }
}