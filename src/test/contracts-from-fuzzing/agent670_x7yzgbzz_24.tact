struct Embed {
    a: Int;
    b: Bool?;
}

struct Wrap {
    inner: Embed?;
}

struct Topper {
    part: Wrap;
    val: Int;
}

contract DoubleOptWrap {
    holder: Topper;

    init() {
        self.holder = Topper{
            part: Wrap{ inner: null },
            val: 42,
        };
    }
}