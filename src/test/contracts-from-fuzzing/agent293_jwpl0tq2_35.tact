struct DeepNestedOpt {
    inner: Mid?;
    val: Int;
}

struct Mid {
    leaf: Leaf?;
}

struct Leaf {
    i: Int;
}

contract DeepOptContract {
    val: DeepNestedOpt;

    init() {
        self.val = DeepNestedOpt{
            inner: null,
            val: 0
        };
    }
}