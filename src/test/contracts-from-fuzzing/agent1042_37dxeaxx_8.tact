struct OptInner {
    innerVal: Int?;
}

contract OptNestedPersistent {
    f: OptInner;
    init() {
        self.f = OptInner{innerVal: null};
    }
}