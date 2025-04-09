struct Inner {
    s: String;
}

struct Outer {
    inner: Inner;
    s2: String;
}

contract BugTest {
    opt: Outer?;

    init() {
        self.opt = Outer{
            inner: Inner{ s: "hi" },
            s2: "yo"
        };
    }
}