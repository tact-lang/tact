struct Deep {
    d: Int?;
}

struct Wrap {
    inner: Deep?;
    val: Int = 3;
}

contract PartPartialOptionals {
    data: Wrap;

    init() {
        self.data = Wrap{
            inner: Deep{},
            val: 100
        };
    }
}