struct Big {
    val1: Int;
    val2: String;
    val3: Int?;
    val4: Bool?;
    val5: String;
    val6: Int;
}

contract BigPersistent {
    state: Big;

    init() {
        self.state = Big{
            val1:99, val2:"hey", val3:null, val4:false, val5:"yo", val6:100
        };
    }
}