// contract with a large struct containing a mix of optional and non-optional fields
struct MixedFields {
    a: Int?;
    b: Bool;
    c: String?;
    d: Cell;
    e: Bool?;
    f: Address;
    g: Int;
    h: String;
}

contract MixedLarge {
    val: MixedFields;

    init() {
        self.val = MixedFields{
            a: null, b: false, c: null, d: emptyCell(),
            e: null, f: myAddress(), g: 0, h: "" };
    }
}