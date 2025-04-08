struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
    g: Int;
    h: Bool;
    i: String;
    j: Address;
    k: Slice;
    l: Cell;
}

contract LargeStructStorage {
    storage: LargeStruct;

    init() {
        self.storage = LargeStruct{
            a:1,b:true,c:"c",d:myAddress(),e:emptySlice(),f:emptyCell(),
            g:7,h:false,i:"i",j:myAddress(),k:emptySlice(),l:emptyCell()
        };
    }
}