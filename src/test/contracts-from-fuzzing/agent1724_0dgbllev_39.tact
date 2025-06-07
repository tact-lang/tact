struct SS {
    i:Int;
    b:Bool;
}

contract StructMix {
    f1:Int;
    f2:Bool;
    s1:SS;
    s2:SS?;
    init(){
        self.f1=1;
        self.f2=true;
        self.s1=SS{i:2,b:false};
        self.s2=null;
    }
}