struct SI {
    si1: Int as uint8;
    si2: Int as int4;
    si3: Int as uint12;
}

struct SC {
    a: SI;
    b: SI;
}

contract CSerials {
    state: SC;

    init() {
        self.state = SC{
            a: SI{ si1:10, si2:-3, si3:100 },
            b: SI{ si1:20, si2:-2, si3:200 }
        };
    }
}