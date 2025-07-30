struct FlatTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
}

contract FlatFields {
    x: Int;
    y: Bool;
    z: FlatTypes;

    init() {
        self.x = 1;
        self.y = false;
        self.z = FlatTypes{
            i: 42, b: true, s: "hi", c: emptyCell(), sl: emptyCell().asSlice(), a: myAddress()
        };
    }
}