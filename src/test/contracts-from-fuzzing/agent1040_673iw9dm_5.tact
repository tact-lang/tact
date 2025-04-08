struct OptInner {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    nestedOpt: OptInner;

    init() {
        self.nestedOpt = OptInner{
            foo: null,
            bar: true
        };
    }
}