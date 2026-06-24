struct Everything {
    x: Int;
    y: Bool;
    z: String;
    a: Cell;
    b: Slice;
    c: Address;
    ox: Int?;
    oy: Bool?;
    oz: String?;
    oa: Cell?;
    ob: Slice?;
    oc: Address?;
}

contract TestContract {
    all: Everything;

    init() {
        self.all = Everything{
            x: 1,
            y: true,
            z: "test",
            a: emptyCell(),
            b: emptyCell().asSlice(),
            c: myAddress(),
            ox: null,
            oy: null,
            oz: null,
            oa: null,
            ob: null,
            oc: null,
        };
    }
}
