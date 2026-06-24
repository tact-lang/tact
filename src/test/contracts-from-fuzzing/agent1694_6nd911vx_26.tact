struct Inner {
    s1: String;
    s2: String;
}

struct Outer {
    inner: Inner;
    s3: String;
}

contract StringMix {
    val: Outer;
    init() {
        self.val = Outer{
            inner: Inner{ s1: "", s2: "你好" },
            s3: "Привет"
        };
    }
}