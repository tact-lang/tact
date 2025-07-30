struct Defaulted {
    a: Int = 5;
    b: Bool = true;
    c: String = "def";
    d: Int?;
}

struct OuterWrap {
    inner: Defaulted;
}

contract DefaultOptionalTest {
    storage: OuterWrap;

    init() {
        self.storage = OuterWrap{
            inner: Defaulted{
                a: 7,  // override default
                b: false, // override
                c: "changed", // override
                d: null   // remain null
            }
        };
    }
}