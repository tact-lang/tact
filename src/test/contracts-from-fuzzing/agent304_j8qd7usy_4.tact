struct WithOptionals {
    foo: Int?;
    bar: Bool?;
    cellField: Cell?;
}

contract Test {
    opt: WithOptionals;

    init() {
        self.opt = WithOptionals{foo: null, bar: true, cellField: emptyCell()};
    }
}