struct SerializedOpt {
    x: Int as int64;
    y: Int as uint32;
    coinsVal: Int as coins;
}

contract OptSer {
    data: SerializedOpt?;

    init() {
        self.data = null;
    }
}