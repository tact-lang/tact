struct Inner {
    x: Int;
    y: Int?;
}

contract NestedSingle(
    data: Inner,
) {
    get fun getData(): Inner {
        return self.data;
    }
}