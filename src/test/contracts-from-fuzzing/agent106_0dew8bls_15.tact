struct SerializeStruct {
    i4: Int as int4;
    u4: Int as uint4;
    str: String;
    sVal: Slice;
}

contract StructSerialization {
    data: SerializeStruct;

    init() {
        self.data = SerializeStruct{
            i4: -3,
            u4: 9,
            str: "ok",
            sVal: emptyCell().asSlice()
        };
    }

    receive() {
        self.data = self.data;
    }
}