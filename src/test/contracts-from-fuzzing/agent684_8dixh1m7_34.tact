struct OuterWrap {
    i: Int;
    inner: InnerWrap;
}

struct InnerWrap {
    s: String;
    flag: Bool?;
}

contract WrapTest {
    wrap: OuterWrap;
    init() {
        self.wrap = OuterWrap {
            i:1,
            inner: InnerWrap {
                s:"string",
                flag:null
            }
        };
    }
}