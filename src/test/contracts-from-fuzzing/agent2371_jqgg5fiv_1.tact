struct InnerStruct { flag: Bool; val: Int; }

contract TestContract {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{ flag: true, val: 42 };
    }
}