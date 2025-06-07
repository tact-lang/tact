struct DeepNested {
    inner1: Bool;
    inner2: Bool?;
    inner3: NestedInner;
}

struct NestedInner {
    val: Int = 42;
    flag: Bool = true;
    opt: String?;
}

contract ComplexContract {
    data: DeepNested;

    init() {
        self.data = DeepNested {
            inner1: true,
            inner2: null,
            inner3: NestedInner {
                val: 123,
                flag: false,
                opt: "hello"
            }
        };
    }

    receive() {
        let _ = self.data.inner3.flag;
    }
}