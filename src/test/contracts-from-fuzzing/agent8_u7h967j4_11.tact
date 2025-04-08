struct OptInner {
    foo: Int?;
    bar: Bool?;
}

contract OptPersist {
    data: OptInner?;

    init() {
        self.data = OptInner{ foo: 100, bar: false };
    }
}