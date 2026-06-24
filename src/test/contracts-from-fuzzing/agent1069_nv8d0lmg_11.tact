struct SDeep {
    d1: Int;
    d2: Int?;
    d3: Bool;
    d4: String?;
    d5: Address;
}

contract ManyOptionals {
    s: SDeep;

    init() {
        self.s = SDeep{d1:1,d2:null,d3:true,d4:null,d5:myAddress()};
    }
}