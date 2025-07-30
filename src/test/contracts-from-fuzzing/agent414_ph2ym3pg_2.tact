struct NestedOpt {
    inner: Int?;
}

contract OptInStruct {
    data: NestedOpt?;
    init() {
        self.data = NestedOpt{ inner: 7 };
    }
}
