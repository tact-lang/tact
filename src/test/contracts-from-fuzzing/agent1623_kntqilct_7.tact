struct LargeStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: Int;
    g: Bool;
    h: Address;
    i: Cell;
    j: Slice;
    k: Int;
    l: Bool;
    m: Address;
    n: Cell;
    o: Slice;
}

contract LargeStructStorage {
    foo: LargeStruct;
    
    init() {
        self.foo = LargeStruct{
            a:1,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),
            f:2,g:false,h:myAddress(),i:emptyCell(),j:emptyCell().asSlice(),
            k:3,l:true,m:myAddress(),n:emptyCell(),o:emptyCell().asSlice(),
        };
    }
}