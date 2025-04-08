struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    value: Int;
    flag: Bool;
}

contract NestedOptionalTest {
    data: NestedOptional;
    init() {
        self.data = NestedOptional{ inner: Inner{value:5, flag:true} };
    }
}
