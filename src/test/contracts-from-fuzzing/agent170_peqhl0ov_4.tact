struct DeepNested {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
}

contract TestContract {
    val: DeepNested = DeepNested{
        a: 1,
        b: true,
        c: "c",
        d: 2,
        e: null,
        f: "f",
        g: 3,
        h: false,
        i: "i",
        j: null,
    };

    init() {
        self.val = DeepNested{
            a: 10,
            b: false,
            c: "cc",
            d: null,
            e: true,
            f: "ff",
            g: 30,
            h: true,
            i: "ii",
            j: 100,
        };
    }

    receive() {
        let _ = self.val.h;
    }
}