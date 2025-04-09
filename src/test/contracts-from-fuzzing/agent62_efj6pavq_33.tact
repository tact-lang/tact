struct InnerStr {
    v: String;
}

struct OuterStr {
    inner: InnerStr;
    a: Int;
    optStr: String?;
}

contract StrNestTest {
    dat: OuterStr;

    init() {
        self.dat = OuterStr{
            inner: InnerStr{ v:"hello" },
            a:42,
            optStr:null
        };
    }
}