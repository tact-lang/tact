struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    inner: Inner?;
    flag: Bool;
}

contract NestedOptionalStorage {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null,
            flag: true,
        };
    }
}