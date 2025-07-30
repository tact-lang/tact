struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int;
    h: Bool;
}

contract TestContract {
    pers: LargeStruct;

    init() {
        self.pers = LargeStruct{
            a:1,b:true,c:"x",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(),g:2,h:false
        };
    }
}