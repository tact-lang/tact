struct IntsAndBools {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: Int?;
    f: Bool?;
}

struct StringsAndAddresses {
    s1: String;
    s2: String;
    addr1: Address;
    addr2: Address;
}

contract MixedDeep {
    val1: IntsAndBools;
    val2: StringsAndAddresses;

    init() {
        self.val1 = IntsAndBools{
            a:1,b:2,c:true,d:false,e:null,f:null
        };
        self.val2 = StringsAndAddresses{
            s1:"hi",s2:"there",addr1:myAddress(),addr2:myAddress()
        };
    }
}