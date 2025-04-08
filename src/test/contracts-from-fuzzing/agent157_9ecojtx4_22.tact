struct VariousPrimitiveOpt {
    intf: Int?;
    boolf: Bool?;
    stringf: String?;
    addressf: Address?;
    cellf: Cell?;
    slicef: Slice?;
}

contract VariousPrimitiveOptTest {
    data: VariousPrimitiveOpt;

    init() {
        self.data = VariousPrimitiveOpt{
            intf: null,
            boolf: null,
            stringf: null,
            addressf: null,
            cellf: null,
            slicef: null
        };
    }
}
