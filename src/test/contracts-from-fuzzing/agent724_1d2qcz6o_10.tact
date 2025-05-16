struct Inner {
    val: Int;
}

struct Mixed {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Inner?;
    e: Inner;
}

contract TestContract {
    m: Mixed;

    init() {
        self.m = Mixed{
            a: null,
            b: null,
            c: null,
            d: null,
            e: Inner{val: 42}
        };
    }
}