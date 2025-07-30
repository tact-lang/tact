struct InnerStruct {
    x: Int;
    y: Int;
}

contract NestedStructField {
    pt: InnerStruct;

    init() {
        self.pt = InnerStruct{x: 1, y: 2};
    }
}
