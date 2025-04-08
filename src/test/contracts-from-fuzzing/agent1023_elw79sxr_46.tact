struct WithMany {
    a:Int; b:Bool; c:String; d:Address; e:Cell; f:Slice; 
    aO:Int?; bO:Bool?; cO:String?; dO:Address?; eO:Cell?; fO:Slice?;
}

contract ManyStructFields {
    val: WithMany;

    init() {
        self.val = WithMany{
            a:1,b:true,c:"x",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(),
            aO:null,bO:null,cO:null,dO:null,eO:null,fO:null
        };
    }
}