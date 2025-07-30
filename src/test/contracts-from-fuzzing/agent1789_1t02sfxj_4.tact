struct Deep3 {
    val: Int = 3;
}

struct Deep2 {
    inner: Deep3;
    flag: Bool = false;
}

struct Deep1 {
    nested: Deep2;
    txt: String = "hi";
}

contract TestContract {
    deep: Deep1 = Deep1{ nested: Deep2{ inner: Deep3{}, flag: true }, txt: "bye" };

    init() {
        self.deep = Deep1{
            nested: Deep2{
                inner: Deep3{ val: 99 },
                flag: false
            },
            txt: "deep"
        };
    }

    receive() {
        let _ = self.deep.nested.inner.val + (self.deep.nested.flag ? 1 : 0);
    }
}