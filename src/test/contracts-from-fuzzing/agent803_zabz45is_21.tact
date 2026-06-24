struct Combo {
    i: Int;
    optS: String?;
    f: Bool;
    optAddr: Address?;
    s: String;
}

contract ComboTest {
    comboVal: Combo;
    init() {
        self.comboVal = Combo{
            i:10,
            optS:null,
            f:true,
            optAddr:null,
            s:"abc"
        };
    }
}