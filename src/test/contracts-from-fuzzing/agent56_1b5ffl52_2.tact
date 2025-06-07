struct NestedLevel2 {
    z: Bool?;
}

struct NestedLevel1 {
    y: Int;
    inner: NestedLevel2;
}

contract DeepStructTest {
    field: NestedLevel1;

    init() {
        self.field = NestedLevel1{
            y: 1,
            inner: NestedLevel2{
                z: false,
            },
        };
    }
}