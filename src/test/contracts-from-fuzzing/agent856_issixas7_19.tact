struct InnerStruct {
    x: Int;
    y: Int;
}

contract DefaultedStructField {
    inner: InnerStruct = InnerStruct{ x: 1, y: 2 };

    init() {
        self.inner = InnerStruct{ x:100, y:200 };
    }
}