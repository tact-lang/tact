struct OneWrap {
    o: Int?;
}

struct TwoWrap {
    nested: OneWrap;
}

struct ThreeWrap {
    nested: TwoWrap;
}

struct FourWrap {
    nested: ThreeWrap;
}

contract FourLevel {
    val: FourWrap;

    init() {
        self.val = FourWrap{
            nested: ThreeWrap {
                nested: TwoWrap {
                    nested: OneWrap { o: null }
                }
            }
        };
    }

    receive() {}
}