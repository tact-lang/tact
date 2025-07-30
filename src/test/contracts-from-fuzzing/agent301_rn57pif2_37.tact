struct Inner {
    num: Int?;
}

struct BigMix {
    txt: String;
    optnum: Int?;
    flag: Bool?;
    addr: Address;
    nested: Inner?;
}

contract TestContract {
    data: BigMix;

    init() {
        self.data = BigMix{
            txt: "x",
            optnum: null,
            flag: true,
            addr: myAddress(),
            nested: null
        };
    }

    receive() {
        let _ = self.data.txt;
    }
}