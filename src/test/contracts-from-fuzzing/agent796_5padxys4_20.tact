contract Test {
    rec: Recursive;
    init() {
        self.rec = Recursive{ item: Inner{ val: 42 } };
    }
}

struct Recursive {
    item: Inner;
}

struct Inner {
    val: Int;
}