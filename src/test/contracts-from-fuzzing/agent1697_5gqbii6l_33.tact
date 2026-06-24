struct SerAndOpt {
    a: Int as uint8;
    b: Int as uint32 = 10;
    c: Int?;
    d: Int? = null;
}

struct OuterSer {
    inner: SerAndOpt?;
}

contract TestContract {
    so: OuterSer;

    init() {
        self.so = OuterSer{
            inner: SerAndOpt{
                a:1,
                c:null
            }
        };
    }
}