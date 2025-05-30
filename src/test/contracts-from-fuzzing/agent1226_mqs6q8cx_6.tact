struct Nested {
    inner: Inner;
}

struct Inner {
    s: SubInner;
}

struct SubInner {
    flag: Bool;
    txt: String?;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{
            inner: Inner{
                s: SubInner{
                    flag: false,
                    txt: null
                }
            }
        };
    }
}