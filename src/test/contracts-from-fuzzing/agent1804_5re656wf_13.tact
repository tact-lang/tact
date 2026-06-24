struct OptionalContainer {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Cell;
    f: Address;
    g: Slice;
}

contract OptionalStructWrapper {
    cont: OptionalContainer?;

    init() {
        self.cont = null;
    }
}