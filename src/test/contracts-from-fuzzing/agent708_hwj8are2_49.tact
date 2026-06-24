contract EmptyMiddleNested {
    s: List;
    init() {
        self.s = List{
            inner: Inner{ val: 1 }
        };
    }
}

struct Inner {
    val: Int;
}

struct List {
    inner: Inner;
}