struct Inner {
    foo: Int = 10;
    bar: Int = 20;
}

contract Defaults {
    nest: Inner;
    init() {
        self.nest = Inner{ foo: 1, bar: 2 };
    }
}