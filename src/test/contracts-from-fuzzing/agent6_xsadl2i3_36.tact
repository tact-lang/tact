struct Inner {
    a: Int;
    b: Bool? = null;
    c: String? = "foo";
}
struct Wrap {
    x: Int;
    inner: Inner?;
}
contract PartialWeird {
    w: Wrap;

    init() {
        self.w = Wrap{
            x: 9,
            inner: Inner{
                a: 1
            }
        };
    }
}