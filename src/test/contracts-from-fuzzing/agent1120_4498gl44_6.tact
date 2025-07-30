struct SInner {
    sn: String?;
    bi: Bool;
}

struct SOuter {
    int: Int;
    inner: SInner;
    str: String;
}

contract Combo {
    data: SOuter;
    init() {
        self.data = SOuter{
            int: 42,
            inner: SInner{sn: null, bi:true},
            str: "hello"
        };
    }
}