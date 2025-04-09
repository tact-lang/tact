struct SInner {
    value: Int?;
}

struct SMid {
    inner: SInner;
}

struct SOuter {
    mid: SMid;
}

contract DeepStructOpt {
    data: SOuter;

    init() {
        self.data = SOuter{
            mid: SMid{
                inner: SInner{ value: null },
            },
        };
    }
}