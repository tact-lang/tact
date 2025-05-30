struct Combo2 {
    x: Int;
    y: Bool?;
    z: String;
    s: Slice;
    c: Cell;
    a: Address;
}

contract ManyTypesInit {
    cfield: Combo2;

    init() {
        self.cfield = Combo2{
            x: 10, y: null, z: "hi",
            s: emptyCell().asSlice(),
            c: emptyCell(),
            a: myAddress()
        };
    }
}