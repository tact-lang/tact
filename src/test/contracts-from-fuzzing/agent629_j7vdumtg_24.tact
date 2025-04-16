struct Inner {
    foo: Int?;
}
struct Outer {
    inner: Inner;
}

contract MultiLayerOptNull {
    val: Outer;
    init() {
        self.val = Outer{
            inner: Inner{
                foo: null
            }
        };
    }
}