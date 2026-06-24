struct NestedOptionals {
    inner: InnerOption?;
}

struct InnerOption {
    deep: DeepOption?;
}

struct DeepOption {
    val: Int?;
}

contract TestContract {
    s: NestedOptionals;

    init() {
        self.s = NestedOptionals{
            inner: InnerOption{
                deep: DeepOption{val: null}
            }
        };
    }
}
