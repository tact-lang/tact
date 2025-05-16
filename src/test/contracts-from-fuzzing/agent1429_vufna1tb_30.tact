struct InnerDefaultOpt {
    foo: Int? = null;
}

contract OptInnerDefault {
    data: InnerDefaultOpt;

    init() {
        self.data = InnerDefaultOpt{ foo: 1 };
    }
}
