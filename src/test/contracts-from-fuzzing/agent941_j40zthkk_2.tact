struct InnerStruct {
    x: Int;
    y: Int;
}

contract StructFieldContract {
    inner: InnerStruct = InnerStruct{x: 1, y: 2};

    receive() {
        self.inner = InnerStruct{x: 3, y: 4};
    }
}