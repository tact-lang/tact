contract ConstMix {
    const A: Int = 100;
    const B: Int = 200;

    x: Int = 1;
    y: Int;

    init() {
        self.y = 42;
    }
}