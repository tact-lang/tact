struct RecursiveWrap {
    s: Wrapper;
}

struct Wrapper {
    inner: Int?;
}

contract RecursiveStructTest {
    rec: RecursiveWrap;

    init() {
        self.rec = RecursiveWrap{
            s: Wrapper{
                inner: 42
            }
        };
    }
}
