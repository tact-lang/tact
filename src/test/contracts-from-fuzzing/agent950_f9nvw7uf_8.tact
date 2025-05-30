contract FlatOptional {
    foo: Int?;
    bar: Bool?;
    text: String?;
    cellVal: Cell?;
    sliceVal: Slice?;

    init() {
        self.foo = null;
        self.bar = null;
        self.text = null;
        self.cellVal = null;
        self.sliceVal = null;
    }
}