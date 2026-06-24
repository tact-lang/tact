// test deeply nested mixed struct and message layers
message(0x10) MLayer {
    num: Int;
}

struct SLayer {
    inner: MLayer?;
}

message(0x11) MWrap {
    data: SLayer?;
}

struct OutS {
    top: MWrap?;
}

contract MixedNestOpt {
    store: OutS?;

    init() {
        self.store = OutS{
            top: MWrap{
                data: SLayer{
                    inner: MLayer{ num: 1 }
                }
            }
        };
    }
}