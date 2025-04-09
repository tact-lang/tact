struct PartialSerialized {
    a: Int;
    b: Int as uint32;
    c: Bool;
}

contract PartialSerialStruct {
    data: PartialSerialized;
    init() {
        self.data = PartialSerialized{ a:1, b:33, c:true };
    }
}