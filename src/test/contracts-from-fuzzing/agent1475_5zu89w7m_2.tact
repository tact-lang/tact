struct Deep {
    x: Int;
    y: String;
}

struct Middle {
    d: Deep;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    text: String;
}

contract DeepStorage {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                d: Deep{
                    x: 42,
                    y: "deep",
                },
                flag: true,
            },
            text: "outer",
        };
    }
}