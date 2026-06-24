struct Sub {
    z: Bool;
}

struct Mixed {
    a: Bool;
    b: Int?;
    c: String;
    d: Address;
    e: Slice;
    f: Sub;
}

contract TestContract {
    mixed: Mixed;

    init() {
        self.mixed = Mixed{
            a: true,
            b: null,
            c: "ok",
            d: myAddress(),
            e: emptyCell().asSlice(),
            f: Sub{ z: false }
        };
    }
}