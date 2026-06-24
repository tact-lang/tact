struct SerializedMix {
    i4: Int as int4;
    u10: Int as uint10;
    txt: String?;
}

contract OptSerPersistent {
    data: SerializedMix?;

    init() {
        self.data = null;
    }
}