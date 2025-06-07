struct Wrap {
    val: Int;
}

contract NullableWrap {
    w: Wrap?;
    init() {
        self.w = Wrap{val: 100};
    }
}