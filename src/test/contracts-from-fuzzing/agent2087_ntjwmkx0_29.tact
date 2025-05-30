struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract MixedComplex {
    data: Mixed;

    init() {
        self.data = Mixed{
            i:1,b:true,s:"s",oi:null,ob:null,os:null
        };
    }
}