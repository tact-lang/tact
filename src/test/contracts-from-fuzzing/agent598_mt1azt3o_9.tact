struct DataPayload {
    flag: Bool;
    info: Slice as remaining;
}

struct MsgWrapper {
    header: Int as uint32;
    payload: DataPayload;
}

contract RemainNestedOk {
    msg: MsgWrapper;

    init() {
        self.msg = MsgWrapper{
            header: 1234,
            payload: DataPayload{
                flag: true,
                info: emptyCell().asSlice()
            }
        };
    }
}