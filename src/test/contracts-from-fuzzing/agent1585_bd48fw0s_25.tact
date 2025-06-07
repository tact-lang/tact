struct BigMix {
    a: Int as uint16;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: Address;
    g: String?;
    h: Int as int32;
}

contract BigMixContract {
    val: BigMix;

    init() {
        self.val = BigMix{
            a:65535, b:true, c:"hi", d:null, e:null, f:myAddress(), g:null, h:-12345
        };
    }
}