struct SOpt {
    foo: Int?;
    bar: Bool?;
    baz: Cell?;
}

contract ManyOptionalStruct {
    state: SOpt;

    init() {
        self.state = SOpt{
            foo: null,
            bar: true,
            baz: emptyCell()
        };
    }

    receive() {}
}