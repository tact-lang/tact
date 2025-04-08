struct OptionalInner {
    foo: Int?;
    bar: String?;
}

struct Holder {
    val: OptionalInner;
}

contract OptionalInnerDefaulted {
    holder: Holder;

    init() {
        self.holder = Holder{ val: OptionalInner{} };
    }
}