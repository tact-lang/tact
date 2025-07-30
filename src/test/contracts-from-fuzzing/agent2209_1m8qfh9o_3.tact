struct OptInner {
    num: Int?;
    flag: Bool?;
    addr: Address?;
    nested: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: OptInner;
    init() {
        self.data = OptInner{
            num: null,
            flag: null,
            addr: null,
            nested: null,
        };
    }
}