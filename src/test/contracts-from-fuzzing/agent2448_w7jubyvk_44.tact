// optional Address inside struct
struct AddrOpt {
    addr: Address?;
}

contract AddrOptionalTest {
    val: AddrOpt;

    init() {
        self.val = AddrOpt{ addr: null };
    }
}
