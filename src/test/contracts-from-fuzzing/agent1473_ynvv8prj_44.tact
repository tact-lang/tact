struct OptNestedStruct {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    ons: OptNestedStruct;

    init() {
        self.ons = OptNestedStruct{ inner:null };
    }
}