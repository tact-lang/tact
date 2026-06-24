struct Inner {
    x: Int = 10;
    y: Bool = true;
}

struct Outer {
    nested: Inner = Inner{};
    val: String;
}

contract TestContract {
    s: Outer;
    init() {
        self.s = Outer{
            nested: Inner{ x: 5, y: false },
            val: "test"
        };
    }
}