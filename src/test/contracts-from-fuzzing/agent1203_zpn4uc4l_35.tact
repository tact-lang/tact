struct MixDefaultsOptional {
    a:Int=0;
    b:Bool=true;
    c:String="s";
    d:Int?;
    e:Bool?;
    f:String?;
}
contract MiddleMix {
    val:MixDefaultsOptional;
    init(){
        self.val=MixDefaultsOptional{a:0,b:true,c:"s",d:null,e:null,f:null};
    }
}