struct LL {
    iv: Int?;
    str: String;
    flag: Bool;
}

struct MM {
    ll: LL;
    optLL: LL?;
    addr: Address;
}

contract Test {
    payload: MM;

    init() {
        self.payload = MM{
            ll: LL{iv:null, str:"", flag:false},
            optLL: null,
            addr: myAddress(),
        };
    }
}
