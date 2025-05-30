struct OptDefaults {
    i:Int?;
    b:Bool?;
    s:String?;
}
contract OptDefaultsContract {
    v:OptDefaults;
    init() { self.v = OptDefaults{ i:null, b:null, s:null }; }
}