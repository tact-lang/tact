struct InnerWrap {
    a: Int;
    b: Bool;
}

struct MidWrap {
    inner: InnerWrap;
}

struct OutWrap {
    mid: MidWrap;
}

contract TestContract {
    data: OutWrap;
    init() {
        self.data = OutWrap{
            mid: MidWrap{
                inner: InnerWrap{
                    a: 42,
                    b: true
                }
            }
        };
    }
}