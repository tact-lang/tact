// Large struct with mix of serialization and optionals
struct Combo {
    a: Int;
    b: Int as uint8;
    c: Int?;
    d: Int as int64;
    e: Bool?;
    f: String?;
    g: Bool;
    h: Address;
}

contract MixCombo {
    data: Combo;

    init() {
        self.data = Combo{
            a:1,b:2,c:null,d:3,e:null,f:null,g:true,h:myAddress()
        };
    }
}