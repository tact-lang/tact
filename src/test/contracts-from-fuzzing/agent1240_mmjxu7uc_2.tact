contract NestedDefaultOpt {
    data: Complex;

    init() {
        self.data = Complex{
            inner: Inner{
                name: "hello",
                val: null,
                nestedOpt: null
            }
        };
    }
}

struct Complex {
    inner: Inner;
}

struct Inner {
    name: String = "default name";
    val: Int? = null;
    nestedOpt: Nested? = null;
}

struct Nested {
    x: Int = 10;
}
