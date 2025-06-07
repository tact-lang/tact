struct NestedOpt {
    innerOpt: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract StorageTest {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            innerOpt: Inner{ x:1, y:true }
        };
    }
}