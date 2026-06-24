struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    inner: Inner;
    num: Int;
    flag: Bool;
}

contract DeepNestedContract {
    val: Outer;

    init() {
        self.val = Outer{
            inner: Inner{foo: 7, bar: false},
            num: 42,
            flag: true
        };
    }
}
