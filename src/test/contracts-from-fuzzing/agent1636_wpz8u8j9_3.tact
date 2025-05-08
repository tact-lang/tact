struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: Address?;
    f: String?;
}

struct Container {
    inner: NestedOptionals;
}

contract TestContainer {
    data: Container;

    init() {
        self.data = Container{
            inner: NestedOptionals{
                a: 10,
                b: null,
                c: emptyCell(),
                d: emptyCell().asSlice(),
                e: null,
                f: "test",
            }
        };
    }
}
