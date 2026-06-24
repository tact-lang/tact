struct Deep {
    a: Int?;
    b: Bool;
}

struct Middle {
    d: Deep;
    txt: String;
}

contract OptNested {
    m: Middle;

    init() {
        self.m = Middle{
            d: Deep{
                a: null,
                b: true
            },
            txt: "hi"
        };
    }
}