struct InnerOpt {
    x: Int?;
}

contract NullableInner {
    data: InnerOpt;

    init() {
        self.data = InnerOpt{ x: null };
    }
}