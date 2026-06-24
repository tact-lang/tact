struct ManyFields {
    a1: Int;
    a2: Bool;
    a3: Address;
    a4: Cell;
    a5: Slice;
    a6: String;
    a7: Int;
    a8: Bool;
    a9: Address;
    a10: Cell;
    a11: Slice;
    a12: String;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a1:1, a2:true, a3:myAddress(), a4:emptyCell(), a5:emptyCell().asSlice(), a6:"t",
            a7:2, a8:false, a9:myAddress(), a10:emptyCell(), a11:emptyCell().asSlice(), a12:"b"
        };
    }

    receive() {}
}