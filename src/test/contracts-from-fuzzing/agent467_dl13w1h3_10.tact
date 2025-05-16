// Struct with large amount of primitive fields
struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Address;
    f6: Int;
    f7: Bool;
    f8: String;
    f9: Slice;
    f10: Address;
}

contract BigStructHolder {
    val: BigStruct;

    init() {
        self.val = BigStruct{
            f1:1, f2:true, f3:"a", f4:emptyCell().asSlice(), f5:myAddress(),
            f6:2, f7:false, f8:"b", f9:emptyCell().asSlice(), f10:myAddress()
        };
    }
}
