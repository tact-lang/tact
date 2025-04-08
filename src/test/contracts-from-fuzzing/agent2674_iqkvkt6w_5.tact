struct OptInner {
    x: Int?;
    y: Bool;
}

contract OptionalInsideStructTest {
    store: OptInner;

    init() {
        self.store = OptInner{
            x: null,
            y: true,
        };
    }
}