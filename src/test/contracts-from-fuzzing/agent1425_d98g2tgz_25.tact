// large struct with mix of field types and default values
struct MixedLarge {
    a: Int = 1;
    b: Bool = true;
    c: String = "str";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    g: Address;
    h: Builder;
    i: Cell;
    j: Slice;
}

contract MixedLargeStorage {
    data: MixedLarge;

    init() {
        self.data = MixedLarge{
            g: myAddress(),
            h: beginCell(),
            i: emptyCell(),
            j: emptyCell().asSlice()
        };
    }
}