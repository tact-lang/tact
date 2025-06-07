struct OptNest {
    foo: Int?;
    bar: Bool?;
}

contract TopOptNestedStruct {
    data: OptNest?;

    init() {
        self.data = null;
    }
}