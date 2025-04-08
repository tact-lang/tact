struct MixOpt {
    a: Int?;
    b: Int;
    c: Bool?;
    d: Bool;
    e: String?;
    f: String;
    g: Address?;
    h: Address;
}

contract TestContract {
    state: MixOpt;

    init() {
        self.state = MixOpt{
            a:null, b:0, c:null, d:false, e:null, f:"", g:null, h:myAddress()
        };
    }
}