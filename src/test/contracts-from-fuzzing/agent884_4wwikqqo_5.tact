struct OptInner {
    val: Int?;
}

contract OptInnerField {
    data: OptInner;

    init() {
        self.data = OptInner{ val: null };
    }
}