struct Deepest {
    flag: Bool?;
    num: Int as uint64;
    addr: Address?;
}

struct Inner {
    id: Int;
    info: String?;
    deep: Deepest;
}

contract TestContract {
    rec: Inner;

    init() {
        self.rec = Inner{
            id: 42,
            info: null,
            deep: Deepest{
                flag: null,
                num: 123,
                addr: null,
            }
        };
    }
}