struct ExtraData {
    bonus: String;
    payload: Slice as remaining;
}

struct ComplexMsg {
    id: Int;
    data: ExtraData;
}

contract Test10 {
    msg: ComplexMsg;

    init() {
        self.msg = ComplexMsg{
            id: 99,
            data: ExtraData{
                bonus: "hi",
                payload: emptyCell().asSlice(),
            },
        };
    }
}