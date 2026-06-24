struct MultiOptional {
    a: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;
}

contract ComboStructOptional {
    m: MultiOptional = MultiOptional{
        a: null,
        b: null,
        s: null,
        addr: null,
    };
    receive() {
        let _ = self.m.addr;
    }
}