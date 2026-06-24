struct Inner {
    v1: Int;
    v2: Bool?;
}

struct Middle {
    inner: Inner;
    val: String?;
}

struct Outer {
    middle: Middle;
}

contract DeepStorage {
    data: Outer;
    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    v1: 10,
                    v2: null
                },
                val: null
            }
        };
    }
}