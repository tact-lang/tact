struct InnerDefault {
    x: Int = 100
}

struct OuterDefault {
    inner: InnerDefault;
    y: Int = 200
}

contract TestStructDefaults {
    receive() {
        // Explicitly override the default for y
        let o: OuterDefault = OuterDefault {
            inner: InnerDefault{},
            y: 300
        };
        dump(o.inner.x + o.y); // Expected: 100 + 300 = 400
    }
}
