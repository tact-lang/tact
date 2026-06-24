struct Flat {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract FlatStruct {
    s: Flat;
    init() {
        self.s = Flat{a:1,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"test"};
    }
}