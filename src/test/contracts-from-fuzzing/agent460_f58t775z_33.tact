struct InnerMany {
    f1: Int?; f2: Int?; f3: Int?; f4: Int?; f5: Int?;
    f6: Int?; f7: Int?; f8: Int?; f9: Int?; f10: Int?;
}

contract ManyNestedOpt {
    inner: InnerMany?;
    init() {
        self.inner = null;
    }
}
