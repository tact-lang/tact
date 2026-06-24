struct NestedNullable {
    inner: Inner?;
}

struct Inner {
    flag: Bool;
    txt: String;
}

contract NestedNullableTest {
    data: NestedNullable;
    init() {
        self.data = NestedNullable{
            inner: Inner{
                flag: true,
                txt: "abc"
            }
        };
    }
}