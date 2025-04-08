struct Mix {
    one: Int;
    two: Bool;
    three: String;
}

struct Wrap {
    inner: Mix;
    more: Mix;
}

contract MultiWrap {
    field: Wrap;

    init() {
        self.field = Wrap{
            inner: Mix{ one: 1, two: false, three: "x" },
            more: Mix{ one: 2, two: true, three: "y" }
        };
    }
}
