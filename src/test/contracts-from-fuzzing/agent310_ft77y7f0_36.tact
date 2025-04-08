struct OddWidths {
    a: Int as uint23;
    b: Int? as int17;
    c: Int as uint7;
    d: Int? as uint3;
}

contract TestContract {
    odd: OddWidths?;

    init() {
        self.odd = null;
    }
}
