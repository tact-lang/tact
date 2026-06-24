struct DeepInner {
    num: Int = 1;
    cond: Bool = false;
}

struct Inner {
    deep: DeepInner;
    text: String = "hi";
}

struct Outer {
    inner: Inner;
    flag: Bool = true;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                deep: DeepInner{ num: 42, cond: true },
                text: "ok"
            },
            flag: false
        };
    }
}