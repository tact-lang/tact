struct NestedLevel2 {
    x: Int;
    y: Bool;
}

struct NestedLevel1 {
    a: Int;
    inner: NestedLevel2;
}

contract DeepNesting {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            a: 5,
            inner: NestedLevel2{
                x: 7,
                y: true,
            },
        };
    }

    receive() {}
}