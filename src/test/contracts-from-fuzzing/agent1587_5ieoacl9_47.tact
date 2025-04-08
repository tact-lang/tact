struct WeirdCombo {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    s2: String?;
    b2: Bool?;
}

contract ComboTest {
    c: WeirdCombo;

    init(){
        self.c = WeirdCombo{i:1,b:true,s:"xx",o:null,s2:null,b2:null};
    }
}