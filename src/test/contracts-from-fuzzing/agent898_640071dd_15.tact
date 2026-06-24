struct InnerStruct {
    a: Int;
}

contract NestedField {
    x: Int;
    y: InnerStruct;

    init() {
        self.x = 1;
        self.y = InnerStruct{a:2};
    }
}
