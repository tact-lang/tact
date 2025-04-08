struct WithOptional {
    a: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;
}

contract TestContract {
    f: WithOptional;

    init() {
        self.f = WithOptional{
            a: null, b: null, s: null, addr: null
        };
    }

    receive() {
        self.f = WithOptional{
            a:1, b:true, s:"ok", addr: myAddress()
        };
    }
}