// test struct with many optional fields mixed with non-optional
struct OptionMix {
    a: Int?;
    b: String?;
    c: Address?;
    d: Bool?;
    e: Int;
    f: String;
    g: Address;
    h: Bool;
}

contract OptionMixTest {
    data: OptionMix;
    init() {
        self.data = OptionMix{
            a:null,b:null,c:null,d:null,
            e:5,f:"str",g:myAddress(),h:true
        };
    }
}