struct NestedStruct {
    inner: Int = 42;
}

contract TestStorage {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{inner: 99};
    }
}