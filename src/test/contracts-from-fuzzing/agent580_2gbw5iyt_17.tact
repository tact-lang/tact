struct ManyAddressOpts {
    a: Address?;
    b: Address?;
    c: Address?;
    d: Address?;
    e: Address?;
    f: Address?;
    g: Address?;
    h: Address?;
    i: Address?;
    j: Address?;
}

contract ManyAddrOptContract {
    addrs: ManyAddressOpts;

    init() {
        self.addrs = ManyAddressOpts{
            a:null,b:null,c:null,d:null,e:null,
            f:null,g:null,h:null,i:null,j:null
        };
    }
}