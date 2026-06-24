struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    val: Int;
    opt: Bool?;
}

contract OptionalInside {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ inner: Inner{val:42,opt:null} };
    }
}