struct FlatStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract FlatStructTest {
    s: FlatStruct;

    init() {
        self.s = FlatStruct{
            a:1,b:true,c:"hi",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice()
        };
    }
}
