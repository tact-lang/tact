struct Deep {
    val: Int;
    flag: Bool;
}

struct Middle {
    d: Deep;
    desc: String;
}

contract DeeplyNested {
    m: Middle;

    init() {
        self.m = Middle{ d: Deep{ val: 1, flag: true }, desc: "nested" };
    }
}
