struct InnerStruct {
    k: Int;
    z: Bool;
    addr: Address;
    s: String;
    cl: Cell;
    sl: Slice;
}

contract OptionalsTest {
    optionalStruct: InnerStruct?;

    init() {
        self.optionalStruct = null;
    }
}
