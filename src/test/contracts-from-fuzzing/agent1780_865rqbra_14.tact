struct StringInner {
    s1: String;
    s2: String;
    s3: String;
}

struct StringOuter {
    inner: StringInner;
    suffix: String;
}

contract MultiStringTest {
    data: StringOuter;

    init() {
        self.data = StringOuter{
            inner: StringInner{
                s1: "hello",
                s2: "world",
                s3: "!!!"
            },
            suffix: "done"
        };
    }
}