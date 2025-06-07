struct DeeplyNested {
    n: Int;
    opt: Int?;
}

struct Middle {
    inner: DeeplyNested;
}

contract DoubleNestedField {
    wrapper: Middle;

    init() {
        self.wrapper = Middle{ inner: DeeplyNested{ n: 7, opt: null } };
    }
}