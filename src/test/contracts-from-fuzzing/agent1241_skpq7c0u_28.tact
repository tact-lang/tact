struct OpMsg {
    field1: Int?;
    field2: Bool?;
    field3: String?;
    field4: Slice?;
    field5: Cell?;
    field6: Address?;
}

contract OptBig {
    st: OpMsg;

    init() {
        self.st = OpMsg{
            field1: null,
            field2: null,
            field3: null,
            field4: null,
            field5: null,
            field6: null,
        };
    }
}
