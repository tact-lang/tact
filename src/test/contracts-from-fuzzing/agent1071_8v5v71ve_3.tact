struct Deep1 {
    val: Int = 5;
}

struct Deep2 {
    d1: Deep1;
    flag: Bool = true;
}

struct Deep3 {
    d2: Deep2;
    note: String = "deep";
}

contract Test4 {
    deep: Deep3 = Deep3{ d2: Deep2{ d1: Deep1{ val: 77 }, flag: false }, note: "nest" };

    init() {
        self.deep = Deep3{ d2: Deep2{ d1: Deep1{ val: 88 }, flag: true }, note: "inside" };
    }
}