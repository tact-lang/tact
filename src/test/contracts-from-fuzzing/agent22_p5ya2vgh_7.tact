struct Leaf {
    val1: Int = 5;
    val2: Bool? = null;
}

struct Inner {
    leaf: Leaf?;
    msg: String = "hi";
    optInt: Int? = null;
}

struct Root {
    inner: Inner = Inner{ leaf: null, msg: "hi", optInt: null };
}

contract DeepOptDefaults {
    data: Root;

    init() {
        self.data = Root{};
    }
}
