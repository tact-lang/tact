struct InnerOpt {
    val: Int?;
}

contract OptionalStructFieldDefault {
    x: InnerOpt = InnerOpt{val: null};
    init() {
        self.x = InnerOpt{ val: 42 };
    }
}