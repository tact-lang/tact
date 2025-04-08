struct MsgData {
    x: Int;
    y: Bool?;
    z: String;
}

contract StructOptMix {
    data: MsgData;

    init() {
        self.data = MsgData{
            x:1,
            y:null,
            z:"hi",
        };
    }
}
