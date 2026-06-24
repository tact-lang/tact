struct OnlyOptional {
    a:Int?;
    b:Bool?;
    c:String?;
}
contract OnlyOptionStruct {
    opt:OnlyOptional;
    init(){
        self.opt = OnlyOptional{a:null,b:null,c:null};
    }
}