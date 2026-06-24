struct NestedDeep {
    s: String;
    inner: Inner;
}

struct Inner {
    b: Bool;
    inner2: Inner2;
}

struct Inner2 {
    x: Int;
    flag: Bool;
}

contract DeeplyNested {
    data: NestedDeep;

    init() {
        self.data = NestedDeep{
            s: "ok",
            inner: Inner{
                b: true,
                inner2: Inner2{
                    x: 7,
                    flag: false,
                }
            }
        };
    }
}