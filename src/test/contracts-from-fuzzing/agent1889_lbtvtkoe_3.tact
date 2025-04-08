struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    inner: Inner;
    val: Int?;
    flag: Bool;
}

contract NestedDeep {
    storage: Outer;

    init() {
        self.storage = Outer{
            inner: Inner{
                a: 42,
                b: false,
                c: "hi"
            },
            val: null,
            flag: true
        };
    }
}
