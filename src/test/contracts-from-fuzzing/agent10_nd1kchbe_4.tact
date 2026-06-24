struct Inner {
    x: Int?;
    y: Int?;
}

contract StructWithOptionals {
    value: Inner;

    init() {
        self.value = Inner{ x: null, y: 5 };
    }
}