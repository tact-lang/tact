struct Inner {
    s: String;
}

struct Mid {
    m: Inner;
}

struct Outer {
    o: Mid;
}

contract StringDeep {
    val: Outer;

    init() {
        self.val = Outer{o: Mid{m: Inner{s: "str"}}};
    }
}
