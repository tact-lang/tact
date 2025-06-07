struct MixOptNested {
    foo: Int?;
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract OptionalStructNested {
    data: MixOptNested;

    init() {
        self.data = MixOptNested {
            foo: null,
            inner: Inner { x: 5, y: false }
        };
    }

    receive() {
        if (self.data.inner != null) {
            let _ = self.data.inner!!.x;
        }
    }
}