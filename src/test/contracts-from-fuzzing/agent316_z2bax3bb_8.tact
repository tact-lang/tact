struct Deepest {
    a: Int?;
    b: String?;
}

struct Middle {
    nested: Deepest;
}

struct Top {
    inner: Middle;
}

contract Test {
    data: Top;

    init() {
        self.data = Top{
            inner: Middle{
                nested: Deepest{
                    a: null,
                    b: null
                }
            }
        };
    }
}
