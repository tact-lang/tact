struct InnerFields {
    i1:Int; i2:Int; s1:String; s2:String; b1:Bool; b2:Bool;
    opt1:Int?; opt2:String?; opt3:Bool?;
}

contract ComboPeriphery {
    data: InnerFields;
    init() {
        self.data = InnerFields{i1:1,i2:2,s1:"a",s2:"b",b1:true,b2:false,opt1:null,opt2:null,opt3:null};
    }
}