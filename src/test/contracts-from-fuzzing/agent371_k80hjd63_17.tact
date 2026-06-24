struct PrimitivesDefaults {
    anInt: Int = 5;
    aBool: Bool = true;
    anAddr: Address;
    aCell: Cell;
    aSlice: Slice;
    aStr: String = "hi";
}

contract TestContract {
    x: PrimitivesDefaults;
    init() {
        self.x = PrimitivesDefaults{
            anAddr: myAddress(),
            aCell: emptyCell(),
            aSlice: emptyCell().asSlice()
        };
    }
}