struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Address;
    l: Cell;
}

contract LargeStructContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a:1, b:true, c:"hi", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(), g:beginCell(),
            h:null, i:null, j:"optional string", k:myAddress(), l:emptyCell()
        };
    }
}