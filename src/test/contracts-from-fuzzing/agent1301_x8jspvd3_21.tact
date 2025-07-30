struct OptSerializedDef {
    x: Int? as uint32 = null;
    y: Int? as int64 = null;
    z: Int? as coins = null;
    b: Bool? = null;
    a: Address? = null;
    s: String? = null;
}

contract TestContract {
    f: OptSerializedDef;
    init() {
        self.f = OptSerializedDef{};
    }
}