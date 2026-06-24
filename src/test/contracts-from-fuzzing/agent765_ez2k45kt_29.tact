struct BigMix {
    a:Int;
    b:Bool;
    c:String;
    d:Cell;
    e:Slice;
    f:Int?;
    g:Bool?;
    h:String?;
    i:Cell?;
    j:Slice?;
}

contract TestContract {
    bm: BigMix;

    init() {
        self.bm = BigMix{
            a:1,b:true,c:"str",d:emptyCell(),e:emptyCell().asSlice(),
            f:2,g:false,h:"hi",i:emptyCell(),j:emptyCell().asSlice()
        };
    }
}