struct Huge {
    a:Int; b:Bool; c:String; d:Address; e:Cell; f:Slice;
    g:Int?; h:Bool?; i:String?; j:Address?; k:Cell?; l:Slice?;
    m:Int; n:Bool; o:String; p:Address; q:Cell; r:Slice;
    s:Int?; t:Bool?; u:String?; v:Address?; w:Cell?; x:Slice?;
}

contract TestContract {
    big: Huge;

    init() {
        self.big = Huge{
            a:1,b:true,c:"hi",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(),
            g:null,h:null,i:null,j:null,k:null,l:null,
            m:2,n:false,o:"bye",p:myAddress(),q:emptyCell(),r:emptyCell().asSlice(),
            s:null,t:null,u:null,v:null,w:null,x:null
        };
    }
}