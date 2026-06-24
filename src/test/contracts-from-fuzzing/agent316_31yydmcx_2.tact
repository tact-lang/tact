struct Inner {
    x: Int = 5;
    y: Bool?;
    z: String = "test";
}

struct Middle {
    inner: Inner;
    val: Int?;
}

contract TestContract {
    data: Middle;

    init() {
        self.data = Middle{
            inner: Inner{ y: true },
            val: null
        };
    }
}