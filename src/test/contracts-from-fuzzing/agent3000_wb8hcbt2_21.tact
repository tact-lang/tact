struct Middle {
    s1: String;
    s2: String;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    x: Int;
    y: Int;
}

contract Test21 {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                s1: "hi",
                s2: "there",
                flag: false,
            },
            x: 11,
            y: 22,
        };
    }
}
