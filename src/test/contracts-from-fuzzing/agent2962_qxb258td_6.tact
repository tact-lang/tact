struct InnerMost {
    foo: Int;
}

struct Middle {
    im: InnerMost?;
    note: String;
}

contract OptNestedOptStruct {
    data: Middle?;

    init() {
        self.data = null;
    }
}