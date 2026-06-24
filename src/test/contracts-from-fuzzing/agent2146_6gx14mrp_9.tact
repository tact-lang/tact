struct Deep {
    inner: Inner;
}

struct Inner {
    val: Int;
    s: SubInner;
}

struct SubInner {
    flag: Bool;
    text: String;
}

contract MultiLevelNesting {
    deep: Deep;

    init() {
        self.deep = Deep{
            inner: Inner{
                val: 10,
                s: SubInner{flag: true, text: "abc"}
            }
        };
    }
}