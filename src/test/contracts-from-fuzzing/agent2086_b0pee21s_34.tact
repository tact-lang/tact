struct Inner {
    val: Int as uint6;
}
contract SerializeNested {
    innerField: Inner;
    init() {
        self.innerField = Inner{ val: 23 };
    }
}