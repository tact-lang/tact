struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    txt: String;
    flag: Bool;
}

contract NestedOptTest {
    data: NestedOptional;
    init() {
        self.data = NestedOptional{
            inner: Inner{ txt: "hi", flag: true }
        };
    }
}