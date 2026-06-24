struct BoolNest {
    val1: Bool;
    val2: Bool;
    inner: Inner;
}

struct Inner {
    val3: Bool;
    val4: Bool;
}

contract BoolTest {
    data: BoolNest;

    init() {
        self.data = BoolNest{
            val1: true,
            val2: false,
            inner: Inner{
                val3: true,
                val4: false,
            }
        };
    }
}