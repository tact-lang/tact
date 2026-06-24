struct Inner { innerVal: Int; }

contract TestNestedStruct {
    data: Inner;

    init() {
        self.data = Inner{ innerVal: 123 };
    }
}