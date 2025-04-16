struct SDefaults {
    a:Int=1;
    b:Bool=false;
    c:String="test";
    d:Int?=null;
}
contract UseSDefaults {
    x:SDefaults;
    init() {
        self.x=SDefaults{};
    }
}