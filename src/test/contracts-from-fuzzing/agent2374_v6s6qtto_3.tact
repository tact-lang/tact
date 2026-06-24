struct Deep {
    a: Int;
    b: Int?;
    c: String;
    d: Bool?;
}

struct Middle {
    x: Int;
    y: Deep;
    z: String?;
}

struct Top {
    first: Middle;
    second: Middle;
    third: Bool?
}

contract ComplexStorage {
    state: Top;

    init() {
        self.state = Top{
            first: Middle{
                x: 1,
                y: Deep{
                    a: 1,
                    b: null,
                    c: "c",
                    d: true,
                },
                z: "z",
            },
            second: Middle{
                x: 2,
                y: Deep{
                    a: 2,
                    b: 3,
                    c: "cc",
                    d: null,
                },
                z: null,
            },
            third: false,
        };
    }
}