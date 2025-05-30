// attempt with optional int field with serialization, explicit default
contract OptSerDef {
    num: Int? as uint16 = null;

    init() {
        self.num = null;
    }
}