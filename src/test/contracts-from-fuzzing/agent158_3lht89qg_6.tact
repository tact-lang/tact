struct Inner {
    foo: Int;
    bar: Bool;
}

contract ArrayOfStructs {
    item1: Inner;
    item2: Inner;
    item3: Inner;
    init() {
        self.item1 = Inner{ foo: 1, bar: true };
        self.item2 = Inner{ foo: 2, bar: false };
        self.item3 = Inner{ foo: 3, bar: true };
    }
}