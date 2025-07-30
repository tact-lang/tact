struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int;
    i: String;
    j: Bool;
}

contract StructStorage {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            a:1,b:true,c:"x",d:myAddress(),e:emptyCell(),
            f:emptyCell().asSlice(),g:beginCell(),h:5,i:"y",j:false
        };
    }
}