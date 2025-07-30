struct WithOptionals {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optCell: Cell?;
}

contract TestContract {
    data: WithOptionals;

    init() {
        self.data = WithOptionals {
            optInt: null,
            optBool: true,
            optStr: null,
            optCell: emptyCell(),
        };
    }
}