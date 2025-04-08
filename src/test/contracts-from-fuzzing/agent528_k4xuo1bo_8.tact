struct ManyTypes {
    x: Int;
    y: Bool;
    z: String;
    c: Cell;
    s: Slice;
    ad: Address;
}

contract TestContract {
    mt: ManyTypes;
    init() {
        self.mt = ManyTypes{
            x:1, y:true, z:"hi", c: emptyCell(), s: emptyCell().asSlice(), ad: myAddress()
        };
    }
}