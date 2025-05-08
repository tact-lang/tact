struct InnerDefaults {
    x: Int = 100;
    y: Int = 200;
}

struct OuterDefaults {
    inner: InnerDefaults = InnerDefaults{};
    z: Int;
}

contract TestNestedDefaults {
    receive() {
        let outer: OuterDefaults = OuterDefaults{ z: 300 };
        // Expect outer.inner.x to be default 100
        outer.inner.x;
    }
}
