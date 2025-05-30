struct InlineOpt {
    s: Sub?;
}

struct Sub {
    n: Int;
    inner: InnerOpt;
}

struct InnerOpt {
    txt: String?;
    flag: Bool?;
}

contract StorageTest {
    data: InlineOpt;

    init() {
        self.data = InlineOpt{
            s: Sub{
                n: 42,
                inner: InnerOpt{
                    txt: null,
                    flag: null
                }
            }
        };
    }
}