struct ManyFields {
    a:Int; b:Int?; c:Bool; d:Bool?; e:String; f:String?; g:Address; h:Address?; i:Cell; j:Cell?;
}

contract TopLevel {
    f1: ManyFields;
    f2: ManyFields;
    init() {
        self.f1 = ManyFields{
            a:1,b:null,c:true,d:null,e:"x",f:null,g:myAddress(),h:null,i:emptyCell(),j:null};
        self.f2 = ManyFields{
            a:2,b:null,c:false,d:null,e:"y",f:null,g:myAddress(),h:null,i:emptyCell(),j:null};
    }
}