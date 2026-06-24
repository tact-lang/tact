struct InnerOpt {
    flag: Bool?;
    value: Int?;
}

struct MidOpt {
    inner: InnerOpt?;
    msg: String?;
}

struct OuterOpt {
    mid: MidOpt?;
    addr: Address?;
}

contract TestContract {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            mid: null,
            addr: null
        };
    }
}