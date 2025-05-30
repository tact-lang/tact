struct DeepNested {
    inner: Inner;
}

struct Inner {
    deeper: Deeper;
}

struct Deeper {
    val: Int;
    flag: Bool;
}

contract DeepNestedContract {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            inner: Inner{
                deeper: Deeper{
                    val: 1,
                    flag: false
                }
            }
        };
    }
}