struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    addr: Address?;
    cell: Cell?;
    slice: Slice?;
}

contract TestStorage {
    content: OptionalNested;

    init() {
        self.content = OptionalNested{
            inner: Inner{
                addr: null,
                cell: null,
                slice: null,
            }
        };
    }
}