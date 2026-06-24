struct MixedInterleaved {
    a: Int;
    b: String?;
    c: Bool;
    d: Int?;
    e: Address;
    f: Bool?;
    g: String;
    h: Address?;
}

contract InterleaveTest {
    st: MixedInterleaved;

    init() {
        self.st = MixedInterleaved{
            a:1,
            b:null,
            c:true,
            d:null,
            e:myAddress(),
            f:null,
            g:"hi",
            h:null
        };
    }

    receive() {
        if (self.st.h != null) {
            dump(self.st.h!!);
        }
    }
}