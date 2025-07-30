struct InlineDefaults {
    i:Int=1;
    b:Bool=true;
    s:String="x";
}
contract DefaultsStruct {
    v: InlineDefaults;
    init() { self.v = InlineDefaults{}; }
}