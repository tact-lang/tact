struct InnerMost {
    val: Int;
}

struct Inner {
    innerMost: InnerMost;
    text: String;
}

contract MultiFields {
    count: Int;
    flag: Bool;
    inner: Inner;
    note: String;
    optInt: Int?;

    init() {
        self.count = 1;
        self.flag = true;
        self.inner = Inner { innerMost: InnerMost { val: 77 }, text: "hello" };
        self.note = "world";
        self.optInt = null;
    }
}