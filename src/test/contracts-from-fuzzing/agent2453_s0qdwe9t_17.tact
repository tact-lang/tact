struct OptStruct {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: String?;
}

contract OptionalStructField {
    val: OptStruct;
    init() {
        self.val = OptStruct{ inner: Inner{ x: 1, y: null } };
    }
}