struct NestedInner {
    x: Int;
    y: Int?;
}

struct NestedOuter {
    inner: NestedInner;
    z: Int;
    w: Bool?;
}

contract StorageTest {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                x: 1,
                y: null
            },
            z: 5,
            w: true
        };
    }
}
