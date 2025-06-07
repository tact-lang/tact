contract ImpossibleMix {
    x:Int;
    y:Bool;
    z:String;
    w:Int?;
    u:Bool?;
    v:String?;
    init(){
        self.x=1;self.y=true;self.z="abc";
        self.w=null;self.u=null;self.v=null;
    }
}