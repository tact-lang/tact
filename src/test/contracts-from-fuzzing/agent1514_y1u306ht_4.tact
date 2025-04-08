struct OptInner {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    data: OptInner = OptInner{foo: null, bar: null};

    init() {
        self.data = OptInner{foo: 42, bar: true};
    }
}