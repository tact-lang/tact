struct NestedStructLevel2 {
    val1: Int;
    val2: Bool?;
}

struct NestedStructLevel1 {
    inner: NestedStructLevel2;
    num: Int;
}

contract DeepNestedContract {
    nested: NestedStructLevel1;

    init() {
        self.nested = NestedStructLevel1{
            inner: NestedStructLevel2{ val1: 7, val2: true },
            num: 5
        };
    }
}