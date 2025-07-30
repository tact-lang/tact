struct OptionalNestedStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract TestContract {
    st: OptionalNestedStruct;

    init() {
        self.st = OptionalNestedStruct{
            inner: InnerStruct{ val:5, flag:true }
        };
    }
}