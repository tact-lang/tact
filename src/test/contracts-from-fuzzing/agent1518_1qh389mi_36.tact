struct ManyMixedElements {
    a:Int; b:Int?; c:Bool; d:Bool?; e:Address;
    f:Address?; g:Cell; h:Cell?; i:Slice; j:Slice?;
    k:String; l:String?; m:Int; n:Int?; o:Bool;
    p:Bool?; q:Address; r:Address?; s:Cell; t:Cell?;
}

contract ManyMixed {
    data: ManyMixedElements;

    init() {
        self.data = ManyMixedElements{
            a:1,b:null,c:true,d:false,e:myAddress(),
            f:null,g:emptyCell(),h:null,i:emptyCell().asSlice(),j:null,
            k:"hello",l:null,m:2,n:null,o:false,
            p:true,q:myAddress(),r:null,s:emptyCell(),t:null
        };
    }
}