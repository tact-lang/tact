struct Combo {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Int?;
    val5: Bool?;
    val6: String?;
    val7: Int;
    val8: Bool;
    val9: String;
}

contract ComboContract {
    data: Combo;
    init() {
        self.data = Combo{
            val1:1,val2:true,val3:"x",
            val4:null,val5:false,val6:null,
            val7:7,val8:false,val9:"y"
        };
    }
}