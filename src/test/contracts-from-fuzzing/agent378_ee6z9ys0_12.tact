struct OptionalStruct {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{ inner: null };
    }
}