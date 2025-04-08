struct Mixed {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: String?;
    h: Bool?;
    i: Int?;
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{
            a:1, b:true, c:"hi", d: emptyCell(), e: emptyCell().asSlice(), f: myAddress(), g: null, h: null, i: null
        };
    }
}