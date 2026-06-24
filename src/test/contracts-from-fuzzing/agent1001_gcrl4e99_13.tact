struct Mixed {
    i: Int;
    si: String;
    bo: Bool;
    opi: Int?;
    ops: String?;
    opb: Bool?;
}

contract MixedFields {
    dat: Mixed;
    
    init() {
        self.dat = Mixed{
            i:5, si:"s", bo:true, opi:null, ops:"t", opb:false
        };
    }
}