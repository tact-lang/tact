struct OptionalInner {
    val: Int;
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract OptInnerTest {
    data: OptionalInner = OptionalInner{ val:0, inner:null };

    receive() {
        self.data = OptionalInner{ val:1, inner:Inner{ x:5, y:true } };
    }
}