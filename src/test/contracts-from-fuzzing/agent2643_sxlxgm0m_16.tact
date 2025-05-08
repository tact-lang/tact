struct OptsMix {
    intVal: Int;
    optInt: Int?;
    optBool: Bool?;
    optCell: Cell?;
    optSlice: Slice?;
    optStr: String?;
    optAddr: Address?;
}

contract OptsMixContract {
    data: OptsMix;

    init() {
        self.data = OptsMix{
            intVal: 42,
            optInt: null,
            optBool: true,
            optCell: emptyCell(),
            optSlice: emptyCell().asSlice(),
            optStr: null,
            optAddr: myAddress()
        };
    }
}
