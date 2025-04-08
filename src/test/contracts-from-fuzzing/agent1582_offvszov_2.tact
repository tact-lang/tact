struct NestedStruct {
    innerField: Int;
}

contract TestContract {
    nested: NestedStruct = NestedStruct{ innerField: 1 };

    receive() {
        // do nothing
    }
}