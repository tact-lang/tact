struct Outer {
    inner: Inner?;
}

struct Inner {
    deep: Deepest?;
}

struct Deepest {
    val: Int?;
    flag: Bool?;
}

contract Test11 {
    o: Outer;

    init() {
        self.o = Outer{
            inner: Inner{
                deep: Deepest{
                    val: 12,
                    flag: null
                }
            }
        };
    }
}