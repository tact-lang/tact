struct BigCombo {
    i1:Int;
    i2:Int?;
    b1:Bool;
    b2:Bool?;
    s1:String;
    s2:String?;
}
contract BigComboTest {
    data: BigCombo;
    init() {
        self.data = BigCombo{
            i1:1, i2:null, b1:true, b2:null, s1:"x", s2:null
        };
    }
}