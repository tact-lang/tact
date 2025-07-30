struct SerializeOpt {
    a: Int? as uint32;
}

contract OptionalSerializedStruct {
    s: SerializeOpt;

    init() {
        self.s = SerializeOpt{ a: null };
    }
}