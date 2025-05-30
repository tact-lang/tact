struct NestedStruct {
    field1: Int;
    field2: String;
}

contract TestContract {
    nsOpt: NestedStruct?;

    init() {
        self.nsOpt = null;
    }
}