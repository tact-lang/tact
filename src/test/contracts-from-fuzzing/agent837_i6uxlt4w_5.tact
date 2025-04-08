struct OptNested {
    inner: Inner?;
}

struct Inner {
    i: Int;
    b: Bool;
}

contract TestOptionalStructField {
    data: OptNested;

    init() {
        self.data = OptNested{ inner: null };
    }
    
    receive() {
        let _ = self.data.inner;
    }
}