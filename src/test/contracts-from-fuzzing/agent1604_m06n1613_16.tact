struct Alpha {
    x: Int;
    y: Bool;
}

struct Beta {
    a: Int;
    b: Alpha;
    c: Bool;
    d: String;
}

contract MixTypes {
    data: Beta;

    init() {
        self.data = Beta {
            a: 1,
            b: Alpha { x: 5, y: true },
            c: false,
            d: "test"
        };
    }

    receive() {}
}