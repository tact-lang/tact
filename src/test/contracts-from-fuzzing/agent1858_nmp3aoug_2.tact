struct DeepNestInner {
    f1: Int;
    f2: Bool;
}

struct DeepNestMid {
    inner: DeepNestInner;
    f3: String;
}

struct DeepNestTop {
    mid: DeepNestMid;
    f4: Int?;
}

contract DeepNestedContract {
    deep: DeepNestTop;

    init() {
        self.deep = DeepNestTop{
            mid: DeepNestMid{
                inner: DeepNestInner{
                    f1: 1,
                    f2: true
                },
                f3: "hello"
            },
            f4: null
        };
    }
}