struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Int;
    h: Bool;
    i: String;
    j: Cell;
    k: Slice;
    l: Builder;
}

contract LargeStructContract {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            a:1,b:true,c:"hi",d:emptyCell(),e:emptyCell().asSlice(),f:beginCell(),
            g:2,h:false,i:"bye",j:emptyCell(),k:emptyCell().asSlice(),l:beginCell()
        };
    }
}