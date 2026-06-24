struct Deep {
    s: String?;
    b: Bool;
}

struct Medium {
    d: Deep?;
    i: Int;
}

struct Top {
    m: Medium?;
    addr: Address;
}

contract TestContract {
    val: Top;

    init() {
        self.val = Top{
            m: null,
            addr: myAddress()
        };
    }
}