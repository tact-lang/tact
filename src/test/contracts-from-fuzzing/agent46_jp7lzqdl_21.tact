struct Deep {
    a: Int;
    b: Bool;
    c: String?;
}

struct Deeper {
    inner: Deep;
    flag: Bool?;
    txt: String;
}

contract DeepOptions {
    d: Deeper;

    init() {
        self.d = Deeper{
            inner: Deep{
                a: 1,
                b: true,
                c: null
            },
            flag: null,
            txt: "xx"
        };
    }
}
