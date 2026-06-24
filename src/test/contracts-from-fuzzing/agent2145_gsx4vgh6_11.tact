struct OptionNested {
    inner1: InnerOpt?;
    inner2: InnerOpt?;
    f: Bool;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract StorageTest {
    val: OptionNested;

    init() {
        self.val = OptionNested{
            inner1: null,
            inner2: InnerOpt{ x: 1, y: null },
            f: false
        };
    }
}