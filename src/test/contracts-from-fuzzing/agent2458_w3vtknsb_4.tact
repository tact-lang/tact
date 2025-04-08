struct OptNestedStruct {
    nested: Inner?;
}

struct Inner {
    num: Int;
}

contract TestContract {
    data: OptNestedStruct;

    init() {
        self.data = OptNestedStruct{
            nested: Inner{
                num: 42
            }
        };
    }
}