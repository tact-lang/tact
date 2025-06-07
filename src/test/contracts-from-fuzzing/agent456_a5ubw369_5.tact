struct Depth3 {
    a: Int;
}

struct Depth2 {
    inner: Depth3;
}

struct Depth1 {
    inner: Depth2;
}

contract DeepNestedStructs {
    val: Depth1;

    init() {
        self.val = Depth1 {
            inner: Depth2 {
                inner: Depth3 {
                    a: 42
                }
            }
        };
    }
}