contract ContractDefaults {
    i:Int=5;
    b:Bool=false;
    s:String="hello";
    
    init() {
        self.i=10;
        self.b=true;
        self.s="world";
    }
}
