struct ManyTypes {
    iv: Int;
    bv: Bool;
    sv: String;
    av: Address;
    oiv: Int?;
    osv: String?;
}

contract MixedTypes {
    mt: ManyTypes;

    init() {
        self.mt = ManyTypes{
            iv:1,
            bv:true,
            sv:"hi",
            av: myAddress(),
            oiv:null,
            osv:null
        };
    }
}