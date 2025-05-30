struct Inner {
    val: Int;
    flag: Bool;
}

struct Outer {
    inner: Inner;
    flag2: Bool;
}

contract NestedStructFields {
    content: Outer;

    init() {
        self.content = Outer {
            inner: Inner{val: 5, flag: true},
            flag2: false
        };
    }
}