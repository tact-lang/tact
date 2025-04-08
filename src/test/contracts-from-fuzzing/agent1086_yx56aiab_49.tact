struct WrongOrder {
    foo: Int;
    bar: Bool;
}

contract WrongInitOrder {
    data: WrongOrder;

    init() {
        self.data = WrongOrder{
            bar: true,
            foo: 1
        };
    }
}