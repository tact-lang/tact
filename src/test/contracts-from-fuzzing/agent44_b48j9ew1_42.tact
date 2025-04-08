struct DeepInner {
    s: String?;
}

struct Inner {
    deep: DeepInner;
}

struct Outer {
    inner: Inner;
}

contract Wrapper {
    val: Outer;

    init() {
        self.val = Outer{ inner: Inner{ deep: DeepInner{ s: null } } };
    }

    receive() {
        self.val.inner.deep.s = "hi";
    }
}