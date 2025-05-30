struct AddrStr {
    addr: Address;
    name: String;
}

struct WrapOpt {
    inner: AddrStr?;
}

contract OptStructFields {
    val: WrapOpt;

    init() {
        self.val = WrapOpt{
            inner: null
        };
    }
}
