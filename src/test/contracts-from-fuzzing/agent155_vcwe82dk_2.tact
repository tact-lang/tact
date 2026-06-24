struct Inner {
    val: Int = 42;
}

struct Outer {
    inner: Inner;
    name: String = "outer";
}

contract TestContract {
    data: Outer = Outer{ inner: Inner{ val: 42 }, name: "outer" };

    init() {
        self.data = Outer{ inner: Inner{ val: 42 }, name: "outer" };
    }
}