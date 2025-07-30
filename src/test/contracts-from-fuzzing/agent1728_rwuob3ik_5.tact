struct LargeStruct {
    a: Int;
    b: String;
    c: Bool;
    d: Cell;
    e: Slice;
    f: Bool?;
    g: String?;
    h: Int?;
    i: Cell;
    j: Slice;
    k: String;
    l: Bool;
}

contract TestContract {
    ls: LargeStruct;

    init() {
        self.ls = LargeStruct{
            a:1,b:"x",c:true,d:emptyCell(),e:emptyCell().asSlice(),
            f:null,g:null,h:null,i:emptyCell(),j:emptyCell().asSlice(),k:"y",l:false
        };
    }
}