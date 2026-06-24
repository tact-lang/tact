struct Inner {
    x: Int;
}

struct Outer {
    i: Inner? = Inner{ x: 5 };
}

struct Top {
    o: Outer? = Outer{};
}

contract Test {
    storage: Top;

    init() {
        self.storage = Top{
            o: null
        };
    }
}