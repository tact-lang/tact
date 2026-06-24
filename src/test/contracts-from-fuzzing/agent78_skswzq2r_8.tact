struct LargeNested {
    a:Int;
    b:String;
    c:Bool;
    d:Slice;
    e:Cell;
    f:Int?;
    g:Bool?;
    h:String?;
    i:Slice?;
    j:Cell?;
}

contract LargeStructPersistent {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            a:1,
            b:"hi",
            c:true,
            d:emptyCell().asSlice(),
            e:emptyCell(),
            f:null,
            g:false,
            h:null,
            i:null,
            j:null
        };
    }
}