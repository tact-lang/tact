struct Crazy {
    a: Int; b:Int?; c:Int;
    d: Bool; e:Bool?; f:Bool;
    g: String; h:String?; i:String;
    j: Address; k:Address?; l:Address;
    m: Cell; n:Cell?; o:Cell;
    p: Slice; q:Slice?; r:Slice;
    s: Builder; t:Builder?; u:Builder;
}

contract Test {
    val: Crazy;

    init() {
        self.val = Crazy{
            a:1,b:null,c:2,d:true,e:null,f:false,
            g:"A",h:null,i:"B",j:myAddress(),k:null,l:myAddress(),
            m:emptyCell(),n:null,o:emptyCell(),p:emptyCell().asSlice(),q:null,r:emptyCell().asSlice(),
            s:beginCell(),t:null,u:beginCell()
        };
    }
}