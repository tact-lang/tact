struct InnerStruct {
    val1: Int;
    val2: Int?;
}

contract TestContract {
    storage1: InnerStruct;

    init() {
        self.storage1 = InnerStruct{val1: 1, val2: null};
    }
}