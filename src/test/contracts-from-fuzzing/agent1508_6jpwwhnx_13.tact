struct NullableNested {
    nested: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract TestContract {
    val: NullableNested;

    init() {
        self.val = NullableNested{
            nested: null
        };
    }
}